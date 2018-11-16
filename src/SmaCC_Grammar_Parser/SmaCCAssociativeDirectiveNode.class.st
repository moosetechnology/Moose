Class {
	#name : #SmaCCAssociativeDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'typeToken',
		'symbols'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCAssociativeDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitAssociativeDirective: self
]

{ #category : #generated }
SmaCCAssociativeDirectiveNode >> compositeNodeVariables [
	^ #(#symbols)
]

{ #category : #'generated-initialize-release' }
SmaCCAssociativeDirectiveNode >> initialize [
	super initialize.
	symbols := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCAssociativeDirectiveNode >> symbols [
	^ symbols
]

{ #category : #generated }
SmaCCAssociativeDirectiveNode >> symbols: anOrderedCollection [
	self setParents: self symbols to: nil.
	symbols := anOrderedCollection.
	self setParents: self symbols to: self
]

{ #category : #generated }
SmaCCAssociativeDirectiveNode >> tokenVariables [
	^ #(#typeToken #directiveStartToken #semicolon)
]

{ #category : #generated }
SmaCCAssociativeDirectiveNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
SmaCCAssociativeDirectiveNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
