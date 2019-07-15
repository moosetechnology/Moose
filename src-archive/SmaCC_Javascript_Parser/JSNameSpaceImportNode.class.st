Class {
	#name : #JSNameSpaceImportNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'star',
		'asToken',
		'import'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSNameSpaceImportNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNameSpaceImport: self
]

{ #category : #generated }
JSNameSpaceImportNode >> asToken [
	^ asToken
]

{ #category : #generated }
JSNameSpaceImportNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
JSNameSpaceImportNode >> import [
	^ import
]

{ #category : #generated }
JSNameSpaceImportNode >> import: aJSNameExpressionNode [
	self import notNil
		ifTrue: [ self import parent: nil ].
	import := aJSNameExpressionNode.
	self import notNil
		ifTrue: [ self import parent: self ]
]

{ #category : #generated }
JSNameSpaceImportNode >> nodeVariables [
	^ #(#import)
]

{ #category : #generated }
JSNameSpaceImportNode >> star [
	^ star
]

{ #category : #generated }
JSNameSpaceImportNode >> star: aSmaCCToken [
	star := aSmaCCToken
]

{ #category : #generated }
JSNameSpaceImportNode >> tokenVariables [
	^ #(#star #asToken)
]
