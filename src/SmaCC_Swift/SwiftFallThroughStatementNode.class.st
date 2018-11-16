Class {
	#name : #SwiftFallThroughStatementNode,
	#superclass : #SwiftControlTransferStatementNode,
	#instVars : [
		'fallthroughToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftFallThroughStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFallThroughStatement: self
]

{ #category : #generated }
SwiftFallThroughStatementNode >> fallthroughToken [
	^ fallthroughToken
]

{ #category : #generated }
SwiftFallThroughStatementNode >> fallthroughToken: aSmaCCToken [
	fallthroughToken := aSmaCCToken
]

{ #category : #generated }
SwiftFallThroughStatementNode >> tokenVariables [
	^ #(#fallthroughToken #semicolonToken)
]
