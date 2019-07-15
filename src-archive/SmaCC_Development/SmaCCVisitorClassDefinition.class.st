"
SmaCCVisitorClassDefinition represents the visitor class for the grammar.

Instance Variables
	nodeClassDefinitions	<Collection of: SmaCCNodeClassDefinition>	the node classes to create the visitor for
"
Class {
	#name : #SmaCCVisitorClassDefinition,
	#superclass : #SmaCCClassDefinition,
	#instVars : [
		'nodeClassDefinitions'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCVisitorClassDefinition class >> forClassDefinitions: aCollection [
	^ self new
		nodeClassDefinitions: aCollection;
		yourself
]

{ #category : #compiling }
SmaCCVisitorClassDefinition >> compileMethodsAndVariables [
	nodeClassDefinitions do: [ :each | self compileVisitMethodFor: each ].
	self codeGenerator
		compileAcceptNodeMethodFor: self
		rootNode: grammar rootDefinition
]

{ #category : #compiling }
SmaCCVisitorClassDefinition >> compileVisitMethodFor: aSmaCCNodeClassDefinition [
	self codeGenerator
		compileVisitMethodFor: aSmaCCNodeClassDefinition
		visitor: self
]

{ #category : #accessing }
SmaCCVisitorClassDefinition >> name [
	^ self modelClass name
]

{ #category : #'initialize-release' }
SmaCCVisitorClassDefinition >> nodeClassDefinitions: aCollection [
	nodeClassDefinitions := aCollection
]

{ #category : #private }
SmaCCVisitorClassDefinition >> rootClassName [
	^ SmaCCParseNodeVisitor name
]
