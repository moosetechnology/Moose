Class {
	#name : #CSUsingAliasDirectiveNode,
	#superclass : #CSUsingDirectiveNode,
	#instVars : [
		'name',
		'equalToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUsingAliasDirectiveNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUsingAliasDirective: self
]

{ #category : #generated }
CSUsingAliasDirectiveNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSUsingAliasDirectiveNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSUsingAliasDirectiveNode >> name [
	^ name
]

{ #category : #generated }
CSUsingAliasDirectiveNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSUsingAliasDirectiveNode >> tokenVariables [
	^ #(#name #equalToken #usingToken)
]
