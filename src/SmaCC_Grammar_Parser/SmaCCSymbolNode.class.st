Class {
	#name : #SmaCCSymbolNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'variableNameToken'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCSymbolNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitSymbol: self
]

{ #category : #accessing }
SmaCCSymbolNode >> allPossibilities [
	^ 1
]

{ #category : #iterating }
SmaCCSymbolNode >> alternativesDo: aBlock [
]

{ #category : #accessing }
SmaCCSymbolNode >> possibilities [
	^ 1
]

{ #category : #generated }
SmaCCSymbolNode >> tokenVariables [
	^ #(#variableNameToken)
]

{ #category : #generated }
SmaCCSymbolNode >> variableNameToken [
	^ variableNameToken
]

{ #category : #generated }
SmaCCSymbolNode >> variableNameToken: aSmaCCToken [
	variableNameToken := aSmaCCToken
]
