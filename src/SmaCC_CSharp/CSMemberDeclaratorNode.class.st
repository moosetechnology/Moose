Class {
	#name : #CSMemberDeclaratorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'name',
		'access',
		'identifierToken',
		'equalToken',
		'value'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSMemberDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMemberDeclarator: self
]

{ #category : #generated }
CSMemberDeclaratorNode >> access [
	^ access
]

{ #category : #generated }
CSMemberDeclaratorNode >> access: aCSExpressionNode [
	self access notNil
		ifTrue: [ self access parent: nil ].
	access := aCSExpressionNode.
	self access notNil
		ifTrue: [ self access parent: self ]
]

{ #category : #generated }
CSMemberDeclaratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSMemberDeclaratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSMemberDeclaratorNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSMemberDeclaratorNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSMemberDeclaratorNode >> name [
	^ name
]

{ #category : #generated }
CSMemberDeclaratorNode >> name: aCSSimpleNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aCSSimpleNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
CSMemberDeclaratorNode >> nodeVariables [
	^ #(#name #access #value)
]

{ #category : #generated }
CSMemberDeclaratorNode >> tokenVariables [
	^ #(#identifierToken #equalToken)
]

{ #category : #generated }
CSMemberDeclaratorNode >> value [
	^ value
]

{ #category : #generated }
CSMemberDeclaratorNode >> value: aCSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aCSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
