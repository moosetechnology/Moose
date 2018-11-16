Class {
	#name : #CSExternAliasDirectiveNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'externToken',
		'aliasToken',
		'identifierToken',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSExternAliasDirectiveNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExternAliasDirective: self
]

{ #category : #generated }
CSExternAliasDirectiveNode >> aliasToken [
	^ aliasToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> aliasToken: aSmaCCToken [
	aliasToken := aSmaCCToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> externToken [
	^ externToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> externToken: aSmaCCToken [
	externToken := aSmaCCToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSExternAliasDirectiveNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSExternAliasDirectiveNode >> tokenVariables [
	^ #(#externToken #aliasToken #identifierToken)
]
