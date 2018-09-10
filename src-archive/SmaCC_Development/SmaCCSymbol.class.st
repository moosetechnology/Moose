"
SmaCCSymbol is an abstract class that represents a symbol in our grammar. Symbols can be either terminal or non-terminal. Terminal symbols are mapped to tokens in the grammar and non-terminals are made up of other symbols.

Subclasses must implement the following messages:
	accessing
		calculateFirstTerminals
	testing
		isTerminal

Instance Variables
	firstTerminals	<Set of: SmaCCTerminalSymbol>	the first terminal symbol that this can produce
	name	<String>	the name of the symbol
	precedence	<Integer>	the precedence for the symbol used for shift/reduce conflicts

"
Class {
	#name : #SmaCCSymbol,
	#superclass : #SmaCCGrammarItem,
	#instVars : [
		'name',
		'precedence',
		'firstTerminals'
	],
	#category : #'SmaCC_Development'
}

{ #category : #variables }
SmaCCSymbol class >> mergeOrderedVariableDefinitions: newVariableDefinitions [
	| result |
	result := OrderedCollection new.
	newVariableDefinitions
		do: [ :collection | self mergeVariableDefinitions: collection into: result ].
	^ result
]

{ #category : #variables }
SmaCCSymbol class >> mergeVariableDefinitions: collection into: result [
	collection
		do:
			[ :each | 
			| variable |
			variable := result
				detect: [ :def | def variableName = each variableName ]
				ifNone: [ result add: each copy ].
			each getterMethodName notNil
				ifTrue: [ variable getterMethodName: each getterMethodName ].
			each setterMethodName notNil
				ifTrue: [ variable setterMethodName: each setterMethodName ].
			each isCollection
				ifTrue: [ variable isCollection: true ] ]
]

{ #category : #'instance creation' }
SmaCCSymbol class >> name: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #testing }
SmaCCSymbol >> < aSmaCCSymbol [
	| myPos otherPos |
	myPos := self position.
	otherPos := aSmaCCSymbol position.
	^ myPos = otherPos
		ifTrue: [ self name < aSmaCCSymbol name ]
		ifFalse: [ myPos < otherPos ]
]

{ #category : #private }
SmaCCSymbol >> annotateTokenVariables: aBlock [
	self productionsDo: [ :each | each annotateTokenVariables: aBlock ]
]

{ #category : #private }
SmaCCSymbol >> basicModelTypesForVariable: aString into: productionTypes seen: aSet [
	self
		productionsDo:
			[ :each | 
			productionTypes
				addAll: (each modelTypesForVariable: aString seen: aSet) ]
]

{ #category : #accessing }
SmaCCSymbol >> calculateFirstTerminals [
	^ self subclassResponsibility
]

{ #category : #variables }
SmaCCSymbol >> computeVariableDefinitions [
	| variableCollections |
	variableCollections := OrderedCollection new.
	self
		productionsDo: [ :each | variableCollections add: each variableDefinitions ].
	variableDefinitions := self class
		mergeOrderedVariableDefinitions: variableCollections.
	SmaCCVariableDefinition assignIndices: variableDefinitions.
	^ variableDefinitions
]

{ #category : #accessing }
SmaCCSymbol >> createIdMethod [
	^ false
]

{ #category : #accessing }
SmaCCSymbol >> firstTerminals [
	^ firstTerminals
]

{ #category : #'initialize-release' }
SmaCCSymbol >> initialize [
	super initialize.
	firstTerminals := Set new
]

{ #category : #accessing }
SmaCCSymbol >> isEmptySymbol [
	^ self = grammar emptySymbol
]

{ #category : #testing }
SmaCCSymbol >> isStartingSymbol [
	^ false
]

{ #category : #testing }
SmaCCSymbol >> isTerminal [
	^ self subclassResponsibility
]

{ #category : #private }
SmaCCSymbol >> makeCaseInsensitive [
	
]

{ #category : #accessing }
SmaCCSymbol >> name [
	^ name
]

{ #category : #'initialize-release' }
SmaCCSymbol >> name: aString [
	name := aString
]

{ #category : #accessing }
SmaCCSymbol >> position [
	^ self subclassResponsibility
]

{ #category : #accessing }
SmaCCSymbol >> precedence [
	^ precedence
]

{ #category : #accessing }
SmaCCSymbol >> precedence: anInteger [
	precedence := anInteger
]

{ #category : #printing }
SmaCCSymbol >> printOn: aStream [
	aStream nextPutAll: name
]

{ #category : #accessing }
SmaCCSymbol >> productionsDo: aBlock [
	
]

{ #category : #accessing }
SmaCCSymbol >> regularExpression [
	^ nil
]

{ #category : #testing }
SmaCCSymbol >> requiresNodeType [
	self
		productionsDo: [ :each | 
			each hasNodeClassDefinition
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #accessing }
SmaCCSymbol >> safeMethodName [
	^ self unsafeMethodName
		collect: [ :each | 
			each isAlphaNumeric
				ifTrue: [ each ]
				ifFalse: [ $_ ] ]
]

{ #category : #accessing }
SmaCCSymbol >> size [
	^ 0
]

{ #category : #private }
SmaCCSymbol >> unsafeMethodName [
	^ self printString
]
