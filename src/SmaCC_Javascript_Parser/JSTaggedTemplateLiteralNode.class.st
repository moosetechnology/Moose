Class {
	#name : #JSTaggedTemplateLiteralNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expression',
		'template'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSTaggedTemplateLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTaggedTemplateLiteral: self
]

{ #category : #generated }
JSTaggedTemplateLiteralNode >> expression [
	^ expression
]

{ #category : #generated }
JSTaggedTemplateLiteralNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSTaggedTemplateLiteralNode >> nodeVariables [
	^ #(#expression #template)
]

{ #category : #generated }
JSTaggedTemplateLiteralNode >> template [
	^ template
]

{ #category : #generated }
JSTaggedTemplateLiteralNode >> template: aJSTemplateLiteralNode [
	self template notNil
		ifTrue: [ self template parent: nil ].
	template := aJSTemplateLiteralNode.
	self template notNil
		ifTrue: [ self template parent: self ]
]
