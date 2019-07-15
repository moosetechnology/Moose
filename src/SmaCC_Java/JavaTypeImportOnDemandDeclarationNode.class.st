Class {
	#name : #JavaTypeImportOnDemandDeclarationNode,
	#superclass : #JavaSingleTypeImportDeclarationNode,
	#instVars : [
		'period',
		'star'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaTypeImportOnDemandDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeImportOnDemandDeclaration: self
]

{ #category : #generated }
JavaTypeImportOnDemandDeclarationNode >> period [
	^ period
]

{ #category : #generated }
JavaTypeImportOnDemandDeclarationNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaTypeImportOnDemandDeclarationNode >> star [
	^ star
]

{ #category : #generated }
JavaTypeImportOnDemandDeclarationNode >> star: aSmaCCToken [
	star := aSmaCCToken
]

{ #category : #generated }
JavaTypeImportOnDemandDeclarationNode >> tokenVariables [
	^ #(#period #star #importToken #staticToken)
]
