Class {
	#name : #JSTemplateLiteralNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'parts',
		'expressions'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSTemplateLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTemplateLiteral: self
]

{ #category : #generated }
JSTemplateLiteralNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
JSTemplateLiteralNode >> compositeTokenVariables [
	^ #(#parts)
]

{ #category : #generated }
JSTemplateLiteralNode >> expressions [
	^ expressions
]

{ #category : #generated }
JSTemplateLiteralNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #'generated-initialize-release' }
JSTemplateLiteralNode >> initialize [
	super initialize.
	parts := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
]

{ #category : #generated }
JSTemplateLiteralNode >> parts [
	^ parts
]

{ #category : #generated }
JSTemplateLiteralNode >> parts: anOrderedCollection [
	parts := anOrderedCollection
]
