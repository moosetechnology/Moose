"
SmaCCReduceCode represents the code to be run when we match the rhs.

Subclasses must implement the following messages:
	accessing
		source - returns the code to be run after matching the rhs
	private
		basicModelTypes: - returns the types the source can return (e.g., OrderedCollection, SmaCCToken, etc.)

Instance Variables
	cachedTypes	<Collection of: RBClass>	the type of object that is returned when this reduce action is run
	rhs	<SmaCCRHS>	the RHS that contains this reduce code

"
Class {
	#name : #SmaCCReduceCode,
	#superclass : #Object,
	#instVars : [
		'rhs',
		'cachedTypes'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCReduceCode class >> onRHS: aSmaCCRHS [
	^ self new
		rhs: aSmaCCRHS;
		yourself
]

{ #category : #comparing }
SmaCCReduceCode >> = anObject [
	^ self class = anObject class and: [ self rhs == anObject rhs ]
]

{ #category : #private }
SmaCCReduceCode >> baseClassType [
	^ rhs grammar rootDefinition
]

{ #category : #private }
SmaCCReduceCode >> basicModelTypes: aSet [
	self subclassResponsibility
]

{ #category : #private }
SmaCCReduceCode >> basicModelTypes: aSet forIndex: index [
	^ (rhs at: index) modelTypes: aSet
]

{ #category : #accessing }
SmaCCReduceCode >> codeGenerator [
	^ rhs grammar codeGenerator
]

{ #category : #testing }
SmaCCReduceCode >> hasReduceAction [
	^ true
]

{ #category : #comparing }
SmaCCReduceCode >> hash [
	^ self class hash bitXor: self rhs hash
]

{ #category : #accessing }
SmaCCReduceCode >> model [
	^ rhs model
]

{ #category : #'accessing-types' }
SmaCCReduceCode >> modelTypes: anIdentitySet [
	cachedTypes isNil
		ifTrue: [ cachedTypes := self basicModelTypes: anIdentitySet ].
	^ cachedTypes
]

{ #category : #'accessing-types' }
SmaCCReduceCode >> nodeType: anIdentitySet [
	| index |
	index := self returnedNodeIndex.
	^ index notNil
		ifTrue: [ (rhs at: index) nodeType: anIdentitySet ]
		ifFalse: [ self baseClassType ]
]

{ #category : #'reduce actions' }
SmaCCReduceCode >> reduceExpressionParseTree [
	^ RBParser parseExpression: self source
]

{ #category : #private }
SmaCCReduceCode >> returnedNodeIndex [
	^ self returnedNodeIndexFor: self reduceExpressionParseTree
]

{ #category : #private }
SmaCCReduceCode >> returnedNodeIndexFor: parseTree [
	| index |
	parseTree isCascade
		ifTrue: [ ^ self returnedNodeIndexFor: parseTree messages last ].
	(parseTree isMessage and: [ parseTree selector == #yourself ])
		ifTrue: [ ^ self returnedNodeIndexFor: parseTree receiver ].
	(parseTree isVariable or: [ parseTree isLiteralNode ])
		ifFalse: [ ^ nil ].
	parseTree isVariable
		ifTrue: [ index := rhs indexOfVariable: parseTree name.
			(index between: 1 and: rhs size)
				ifTrue: [ ^ index ] ].
	(parseTree isLiteralNode and: [ parseTree value isString ])
		ifFalse: [ ^ nil ].
	(parseTree value allSatisfy: [ :each | each isDigit ])
		ifTrue: [ index := Integer readFrom: (ReadStream on: parseTree value).
			(index between: 1 and: rhs size)
				ifTrue: [ ^ index ] ].
	^ nil
]

{ #category : #testing }
SmaCCReduceCode >> returnsSingleVariable [
	^ false
]

{ #category : #testing }
SmaCCReduceCode >> returnsVariableCollection [
	^ false
]

{ #category : #accessing }
SmaCCReduceCode >> rhs [
	^ rhs
]

{ #category : #'initialize-release' }
SmaCCReduceCode >> rhs: aSmaCCRHS [
	rhs := aSmaCCRHS
]

{ #category : #accessing }
SmaCCReduceCode >> source [
	^ self subclassResponsibility
]
