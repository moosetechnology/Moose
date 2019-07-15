Class {
	#name : #CSTypeConstraintNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'type'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeConstraintNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeConstraint: self
]

{ #category : #generated }
CSTypeConstraintNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSTypeConstraintNode >> type [
	^ type
]

{ #category : #generated }
CSTypeConstraintNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
