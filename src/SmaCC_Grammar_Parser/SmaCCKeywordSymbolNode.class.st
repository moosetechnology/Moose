Class {
	#name : #SmaCCKeywordSymbolNode,
	#superclass : #SmaCCSymbolNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCKeywordSymbolNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitKeywordSymbol: self
]

{ #category : #generated }
SmaCCKeywordSymbolNode >> name [
	^ name
]

{ #category : #generated }
SmaCCKeywordSymbolNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCKeywordSymbolNode >> tokenVariables [
	^ #(#name #variableNameToken)
]
