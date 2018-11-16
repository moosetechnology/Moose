"
SmaCCCreateNodeReduceCode represents a reduce action that creates a parse node.

Instance Variables
	classDefinition	<SmaCCClassDefinition>	the parse node class to create
	index	<Integer>	index in the RHS of a symbol that returns parse node, if no symbol returns the parse node, then the index = 0
"
Class {
	#name : #SmaCCCreateNodeReduceCode,
	#superclass : #SmaCCReduceCode,
	#instVars : [
		'classDefinition',
		'index'
	],
	#category : #'SmaCC_Development'
}

{ #category : #comparing }
SmaCCCreateNodeReduceCode >> = anObject [
	^ super = anObject
		and:
			[ self classDefinition = anObject classDefinition
				and: [ self index = anObject index ] ]
]

{ #category : #private }
SmaCCCreateNodeReduceCode >> basicModelTypes: aSet [
	^ Array with: self classDefinition modelClass
]

{ #category : #accessing }
SmaCCCreateNodeReduceCode >> classDefinition [
	classDefinition isNil
		ifTrue: [ classDefinition := rhs nodeClassDefinition
				ifNil: [ rhs nodeType ] ].
	^ classDefinition
]

{ #category : #accessing }
SmaCCCreateNodeReduceCode >> index [
	^ index ifNil: [ index := rhs componentIndex ]
]

{ #category : #'initialize-release' }
SmaCCCreateNodeReduceCode >> index: anInteger [
	index := anInteger
]

{ #category : #testing }
SmaCCCreateNodeReduceCode >> isPullUpAction [
	^ self index > 0
]

{ #category : #'accessing-types' }
SmaCCCreateNodeReduceCode >> nodeType: anIdentitySet [
	^ self classDefinition
]

{ #category : #accessing }
SmaCCCreateNodeReduceCode >> source [
	^ self isPullUpAction
		ifTrue:
			[ self codeGenerator
				createNodeReduceAction: rhs
				pullUpFrom: self index ]
		ifFalse: [ self codeGenerator createNodeReduceAction: rhs ]
]
