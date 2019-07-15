Class {
	#name : #JavaStaticInitializerNode,
	#superclass : #JavaInitializerNode,
	#instVars : [
		'staticToken'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaStaticInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStaticInitializer: self
]

{ #category : #generated }
JavaStaticInitializerNode >> staticToken [
	^ staticToken
]

{ #category : #generated }
JavaStaticInitializerNode >> staticToken: aSmaCCToken [
	staticToken := aSmaCCToken
]

{ #category : #generated }
JavaStaticInitializerNode >> tokenVariables [
	^ #(#staticToken)
]
