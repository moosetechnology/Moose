Class {
	#name : #SmaCCSymbolSet,
	#superclass : #Model,
	#instVars : [
		'symbols',
		'components'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCSymbolSet class >> basedOn: aSmaCCSymbolSet [
	^ self new
		baseOn: aSmaCCSymbolSet;
		yourself
]

{ #category : #accessing }
SmaCCSymbolSet >> add: aSmaCCSymbol [
	(symbols includes: aSmaCCSymbol)
		ifTrue: [ ^ self ].
	symbols add: aSmaCCSymbol.
	self changed
]

{ #category : #accessing }
SmaCCSymbolSet >> addAll: aCollection [
	| todo |
	todo := OrderedCollection with: self.
	[ todo notEmpty ]
		whileTrue:
			[ | oldSize current |
			current := todo removeFirst.
			oldSize := current symbols size.
			current symbols addAll: aCollection.
			oldSize ~= current symbols size
				ifTrue: [ todo addAll: current dependents ] ]
]

{ #category : #accessing }
SmaCCSymbolSet >> addComponent: aSmaCCSymbolSet [
	(aSmaCCSymbolSet = self or: [ components includes: aSmaCCSymbolSet ])
		ifTrue: [ ^ self ].
	components add: aSmaCCSymbolSet.
	aSmaCCSymbolSet addDependent: self.
	self addAll: aSmaCCSymbolSet symbols
]

{ #category : #accessing }
SmaCCSymbolSet >> addComponentsFrom: aSmaCCSymbolSet [
	aSmaCCSymbolSet components do: [ :each | self addComponent: each ]
]

{ #category : #testing }
SmaCCSymbolSet >> allSatisfy: aBlock [
	^ symbols allSatisfy: aBlock
]

{ #category : #accessing }
SmaCCSymbolSet >> baseOn: aSmaCCSymbolSet [
	self addComponent: aSmaCCSymbolSet.
	self addAll: aSmaCCSymbolSet symbols
]

{ #category : #accessing }
SmaCCSymbolSet >> components [
	^ components
]

{ #category : #public }
SmaCCSymbolSet >> getDependents [
	^ dependents
]

{ #category : #testing }
SmaCCSymbolSet >> includes: aSmaCCSymbol [
	^ symbols includes: aSmaCCSymbol
]

{ #category : #'initialize-release' }
SmaCCSymbolSet >> initialize [
	super initialize.
	symbols := Set new.
	components := Set new
]

{ #category : #accessing }
SmaCCSymbolSet >> mergeWith: aSmaCCSymbolSet [
	self addAll: aSmaCCSymbolSet symbols.
	self addComponentsFrom: aSmaCCSymbolSet
]

{ #category : #printing }
SmaCCSymbolSet >> printOn: aStream [
	(symbols asSortedCollection: [ :a :b | a name < b name ])
		do: [ :each | aStream nextPutAll: each printString ]
		separatedBy: [ aStream space ]
]

{ #category : #public }
SmaCCSymbolSet >> setDependents: aCollection [
	^ dependents := aCollection
]

{ #category : #accessing }
SmaCCSymbolSet >> size [
	^ symbols size
]

{ #category : #accessing }
SmaCCSymbolSet >> symbols [
	^ symbols
]

{ #category : #updating }
SmaCCSymbolSet >> update: anAspectSymbol with: aParameter from: aSender [
	(components includes: aSender)
		ifTrue: [ self addAll: aSender symbols ]
]
