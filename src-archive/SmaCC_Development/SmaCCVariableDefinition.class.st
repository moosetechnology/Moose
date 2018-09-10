"
SmaCCVariableDefinition represents a variable for a node class.

Instance Variables
	baseType	<RBAbstractClass>	the type of the variable
	getterMethodName	<Symbol>	the getter selector
	index	<Integer>	the index of the variable (if we are pulling up a collection of variables from a symbol)
	isAlwaysAssigned	<Boolean>	does the variable always have a value or can it be nil
	isCollection	<Boolean>	does the variable represent a collection of values
	setterMethodName	<Symbol>	the setter selector
	variableName	<String>	the name of the variable

"
Class {
	#name : #SmaCCVariableDefinition,
	#superclass : #Object,
	#instVars : [
		'variableName',
		'isCollection',
		'baseType',
		'isAlwaysAssigned',
		'getterMethodName',
		'setterMethodName',
		'index'
	],
	#classVars : [
		'PluralNameBlock',
		'PluralNames'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCVariableDefinition class >> assignIndices: aCollection [
	aCollection keysAndValuesDo: [ :index :each | each index: index ]
]

{ #category : #accessing }
SmaCCVariableDefinition class >> pluralNameBlock [
	^ PluralNameBlock ifNil: [ ^ [ :value | nil ] ]
]

{ #category : #accessing }
SmaCCVariableDefinition class >> pluralNameBlock: aBlock [
	PluralNameBlock := aBlock
]

{ #category : #private }
SmaCCVariableDefinition class >> pluralNameFor: aString [
	| size |
	(self pluralNameBlock value: aString)
		ifNotNil: [ :result | ^ result ].
	size := aString size.
	1 to: size do:
		[ :i | 
		(self pluralNames
			at: (aString copyFrom: size - i + 1 to: size)
			ifAbsent: [ nil ])
			ifNotNil: [ :ending | ^ (aString copyFrom: 1 to: size - i) , ending ] ].
	^ aString copyWith: $s
]

{ #category : #accessing }
SmaCCVariableDefinition class >> pluralNames [
	PluralNames isNil
		ifTrue:
			[ PluralNames := Dictionary new.
			PluralNames
				at: 's' put: 'ses';
				at: 'y' put: 'ies';
				at: 'x' put: 'xes';
				at: 'ch' put: 'ches' ].
	^ PluralNames
]

{ #category : #accessing }
SmaCCVariableDefinition class >> pluralNames: aDictionary [
	PluralNames := aDictionary
]

{ #category : #'instance creation' }
SmaCCVariableDefinition class >> variableName: aString [
	^ self new
		variableName: aString;
		isCollection: false;
		yourself
]

{ #category : #comparing }
SmaCCVariableDefinition >> = anObject [
	^ self class = anObject class
		and:
			[ self variableName = anObject variableName
				and: [ self isCollection = anObject isCollection ] ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> baseType [
	^ baseType
]

{ #category : #'initialize-release' }
SmaCCVariableDefinition >> baseType: modelClass [
	baseType := modelClass
]

{ #category : #accessing }
SmaCCVariableDefinition >> collectionType [
	^ self baseType model classFor: OrderedCollection
]

{ #category : #accessing }
SmaCCVariableDefinition >> getterMethodName [
	^ getterMethodName
]

{ #category : #accessing }
SmaCCVariableDefinition >> getterMethodName: aString [
	getterMethodName := aString
]

{ #category : #comparing }
SmaCCVariableDefinition >> hash [
	^ self variableName hash bitXor: self isCollection hash
]

{ #category : #accessing }
SmaCCVariableDefinition >> index [
	^ index
]

{ #category : #accessing }
SmaCCVariableDefinition >> index: anInteger [
	index := anInteger
]

{ #category : #accessing }
SmaCCVariableDefinition >> isAlwaysAssigned [
	^ isAlwaysAssigned or: [ self isCollection ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> isAlwaysAssigned: aBoolean [
	isAlwaysAssigned := aBoolean
]

{ #category : #accessing }
SmaCCVariableDefinition >> isBaseNodeType [
	^ self baseType
		includesClass: (self baseType model classFor: SmaCCParseNode)
]

{ #category : #accessing }
SmaCCVariableDefinition >> isBasePossibleNodeType [
	^ self isBaseNodeType
		or:
			[ (self baseType model classFor: SmaCCParseNode)
				includesClass: self baseType ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> isBaseTokenType [
	^ self baseType
		includesClass: (self baseType model classFor: SmaCCToken)
]

{ #category : #accessing }
SmaCCVariableDefinition >> isCollection [
	^ isCollection
]

{ #category : #'initialize-release' }
SmaCCVariableDefinition >> isCollection: aBoolean [
	isCollection := aBoolean
]

{ #category : #accessing }
SmaCCVariableDefinition >> isNodeCollectionType [
	^ self isCollection and: [ self isBaseNodeType ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> isNodeType [
	^ self isCollection not and: [ self isBaseNodeType ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> isPossibleNodeCollectionType [
	^ self isCollection and: [ self isBasePossibleNodeType ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> isPossibleNodeType [
	^ self isCollection not and: [ self isBasePossibleNodeType ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> setterMethodName [
	^ setterMethodName
]

{ #category : #accessing }
SmaCCVariableDefinition >> setterMethodName: aString [
	setterMethodName := aString
]

{ #category : #accessing }
SmaCCVariableDefinition >> sourceVariableName [
	^ self isCollection
		ifTrue: [ self class pluralNameFor: variableName ]
		ifFalse: [ variableName ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> type [
	^ self isCollection
		ifTrue: [ self collectionType ]
		ifFalse: [ self baseType ]
]

{ #category : #accessing }
SmaCCVariableDefinition >> variableName [
	^ variableName
]

{ #category : #'initialize-release' }
SmaCCVariableDefinition >> variableName: aString [
	variableName := aString
]
