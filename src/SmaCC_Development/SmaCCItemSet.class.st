Class {
	#name : #SmaCCItemSet,
	#superclass : #Set,
	#instVars : [
		'type',
		'previousItemSets',
		'grammar'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCItemSet class >> new [
	^self new: 5
]

{ #category : #'instance creation' }
SmaCCItemSet class >> new: anInteger [
	^ (super new: anInteger)
		initialize;
		yourself
]

{ #category : #comparing }
SmaCCItemSet >> = aSmaCCItemSet [
	self class = aSmaCCItemSet class
		ifTrue:
			[ type == #LALR1
				ifTrue: [ ^ self isLALREqualTo: aSmaCCItemSet ]
				ifFalse: [ ^ self isLREqualTo: aSmaCCItemSet ] ].
	^ false
]

{ #category : #accessing }
SmaCCItemSet >> action: aSmaCCSymbol prefer: aClass [
	| action |
	action := nil.
	self
		do:
			[ :each | 
			| eachAction |
			eachAction := each action: aSmaCCSymbol.
			action := action isNil
				ifTrue: [ eachAction ]
				ifFalse: [ action mergeWith: eachAction prefer: aClass ] ].
	action signalAllWarnings.
	^ action
]

{ #category : #adding }
SmaCCItemSet >> add: aSmaCCLR1Item [
	| index item |
	aSmaCCLR1Item isNil
		ifTrue: [ ^ aSmaCCLR1Item ].
	index := self findElementOrNil: aSmaCCLR1Item.
	item := array at: index.
	item isNil
		ifTrue:
			[ self atNewIndex: index put: aSmaCCLR1Item.
			aSmaCCLR1Item itemSet: self.
			self performClosureOn: aSmaCCLR1Item ]
		ifFalse: [ item mergeWith: aSmaCCLR1Item ].
	^ aSmaCCLR1Item
]

{ #category : #accessing }
SmaCCItemSet >> addPrevious: aSmaCCItemSet [
	previousItemSets add: aSmaCCItemSet
]

{ #category : #accessing }
SmaCCItemSet >> grammar [
	^ grammar
]

{ #category : #accessing }
SmaCCItemSet >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar
]

{ #category : #comparing }
SmaCCItemSet >> hash [
	^ self
		inject: self class hash
		into: [ :sum :each | sum bitXor: each hash ]
]

{ #category : #'initialize-release' }
SmaCCItemSet >> initialize [
	(self class superclass canUnderstand: #initialize)
		ifTrue: [ super initialize ].
	type := #LALR1.
	previousItemSets := OrderedCollection new
]

{ #category : #testing }
SmaCCItemSet >> isLALREqualTo: aSmaCCItemSet [
	^ aSmaCCItemSet size = self size
		and: [ self allSatisfy: [ :each | aSmaCCItemSet includes: each ] ]
]

{ #category : #testing }
SmaCCItemSet >> isLREqualTo: anItemSet [
	^ anItemSet size = self size
		and:
			[ self
				allSatisfy:
					[ :each | 
					| item |
					(item := anItemSet itemFor: each) notNil
						and: [ each isLR1EqualTo: item ] ] ]
]

{ #category : #private }
SmaCCItemSet >> itemFor: anObject [
	^ array at: (self findElementOrNil: anObject)
]

{ #category : #accessing }
SmaCCItemSet >> mergeWith: aSmaCCItemSet [
	self == aSmaCCItemSet
		ifTrue: [ ^ self ].
	self addAll: aSmaCCItemSet.
	previousItemSets addAll: aSmaCCItemSet previousItemSets
]

{ #category : #accessing }
SmaCCItemSet >> moveOn: aSmaCCSymbol [
	| anItemSet |
	anItemSet := self class new.
	anItemSet grammar: grammar.
	anItemSet addPrevious: self.
	anItemSet type: type.
	self
		do:
			[ :each | 
			each nextSymbol == aSmaCCSymbol
				ifTrue: [ anItemSet add: each moveNext ] ].
	^ anItemSet
]

{ #category : #accessing }
SmaCCItemSet >> path [
	| result |
	result := OrderedCollection new.
	self pathInto: result.
	^ result
]

{ #category : #accessing }
SmaCCItemSet >> pathInto: anOrderedCollection [
	| item |
	self previousState isNil
		ifTrue: [ ^ self ].
	self previousState pathInto: anOrderedCollection.
	item := self detect: [ :each | each location > 1 ].
	anOrderedCollection add: (item rhs at: item location - 1)
]

{ #category : #private }
SmaCCItemSet >> performClosureOn: aSmaCCLR1Item [
	| nextSymbol rest first followers |
	nextSymbol := aSmaCCLR1Item nextSymbol.
	nextSymbol isTerminal
		ifTrue: [ ^ self ].
	rest := aSmaCCLR1Item rest.
	first := rest firstTerminals.
	followers := SmaCCSymbolSet new.
	(first includes: grammar emptySymbol)
		ifTrue:
			[ first remove: grammar emptySymbol.
			followers baseOn: aSmaCCLR1Item followers ].
	followers addAll: first.
	nextSymbol
		productionsDo: [ :each | self add: (SmaCCLR1Item rhs: each follow: followers) ]
]

{ #category : #accessing }
SmaCCItemSet >> previousItemSets [
	^ previousItemSets
]

{ #category : #accessing }
SmaCCItemSet >> previousItemSets: aCollection [
	previousItemSets := aCollection
]

{ #category : #accessing }
SmaCCItemSet >> previousState [
	"Pick some previous item set"

	previousItemSets isEmpty
		ifTrue: [ ^ nil ].
	^ previousItemSets first
]

{ #category : #printing }
SmaCCItemSet >> printOn: aStream [
	| strings |
	strings := OrderedCollection new: self size.
	self do: [ :each | strings add: each printString ].
	strings asSortedCollection
		do: [ :each | 
			aStream
				tab;
				nextPutAll: each;
				cr ]
]

{ #category : #'initialize-release' }
SmaCCItemSet >> type: aSymbol [
	type := aSymbol
]
