"
SmaCCGrammarItem is an abstract class that represents something defined by the grammar.

Subclasses must implement the following messages:
	accessing
		modelTypes:
	private
		annotateTokenVariables:
		basicModelTypesForVariable:into:seen:
		firstTerminals

Instance Variables
	grammar	<SmaCCGrammar>	the grammar that we are defined in
	variableDefinitions	<OrderedCollection of: SmaCCVariableDefinition>	the variables defined by this item
"
Class {
	#name : #SmaCCGrammarItem,
	#superclass : #Object,
	#instVars : [
		'variableDefinitions',
		'grammar'
	],
	#category : #'SmaCC_Development'
}

{ #category : #private }
SmaCCGrammarItem >> annotateTokenVariables: aBlock [
	self subclassResponsibility
]

{ #category : #private }
SmaCCGrammarItem >> basicModelTypesForVariable: aString into: aCollection seen: anIdentitySet [
	self subclassResponsibility
]

{ #category : #variables }
SmaCCGrammarItem >> collectionVariableDefinitions [
	^ self variableDefinitions select: [ :each | each isCollection ]
]

{ #category : #variables }
SmaCCGrammarItem >> computeVariableDefinitions [
	^ #()
]

{ #category : #private }
SmaCCGrammarItem >> firstTerminals [
	^ self subclassResponsibility
]

{ #category : #accessing }
SmaCCGrammarItem >> grammar [
	^ grammar
]

{ #category : #'initialize-release' }
SmaCCGrammarItem >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar
]

{ #category : #variables }
SmaCCGrammarItem >> hasVariableNamed: aString [
	^ self variableDefinitions
		anySatisfy: [ :each | each variableName = aString ]
]

{ #category : #variables }
SmaCCGrammarItem >> indexOfVariable: aString [
	self variableDefinitions
		keysAndValuesDo: [ :index :each | 
			each variableName = aString
				ifTrue: [ ^ index ] ].
	self error: 'Variable not found'
]

{ #category : #variables }
SmaCCGrammarItem >> isCollection: aString [
	^ self collectionVariableDefinitions
		anySatisfy: [ :each | each variableName = aString ]
]

{ #category : #'reduce actions' }
SmaCCGrammarItem >> isNode [
	^ self modelType includesClass: (self model classFor: SmaCCParseNode)
]

{ #category : #testing }
SmaCCGrammarItem >> isSubtypeOf: aSmaCCGrammarItem [
	^ self modelType includesClass: aSmaCCGrammarItem modelType
]

{ #category : #accessing }
SmaCCGrammarItem >> model [
	^ self grammar codeGenerator model
]

{ #category : #'reduce actions' }
SmaCCGrammarItem >> modelType [
	^ self modelType: IdentitySet new
]

{ #category : #'reduce actions' }
SmaCCGrammarItem >> modelType: anIdentitySet [
	| types |
	types := self modelTypes: anIdentitySet.
	^ self grammar codeGenerator commonSupertypeOf: types
]

{ #category : #accessing }
SmaCCGrammarItem >> modelTypes [
	^ self modelTypes: IdentitySet new
]

{ #category : #accessing }
SmaCCGrammarItem >> modelTypes: anIdentitySet [
	^ self subclassResponsibility
]

{ #category : #private }
SmaCCGrammarItem >> modelTypesForVariable: aString [
	^ self modelTypesForVariable: aString seen: IdentitySet new
]

{ #category : #private }
SmaCCGrammarItem >> modelTypesForVariable: aString seen: anIdentitySet [
	| productionTypes |
	(anIdentitySet includes: self)
		ifTrue: [ ^ #() ].
	anIdentitySet add: self.
	productionTypes := Set new.
	self
		basicModelTypesForVariable: aString
		into: productionTypes
		seen: anIdentitySet.
	^ productionTypes
]

{ #category : #'reduce actions' }
SmaCCGrammarItem >> nodeType [
	^ self nodeType: IdentitySet new
]

{ #category : #'reduce actions' }
SmaCCGrammarItem >> nodeType: anIdentitySet [
	| node rootType |
	rootType := self modelType: anIdentitySet.
	node := nil.
	(rootType includesClass: (self model classNamed: #SmaCCParseNode))
		ifTrue:
			[ node := self grammar classDefinitions
				detect: [ :e | e modelClass = rootType ]
				ifNone: [ nil ] ].
	^ node
]

{ #category : #testing }
SmaCCGrammarItem >> returnsSingleVariable [
	^ false
]

{ #category : #testing }
SmaCCGrammarItem >> returnsVariableCollection [
	^ false
]

{ #category : #variables }
SmaCCGrammarItem >> variableDefinitions [
	^ variableDefinitions ifNil: [ self computeVariableDefinitions ]
]
