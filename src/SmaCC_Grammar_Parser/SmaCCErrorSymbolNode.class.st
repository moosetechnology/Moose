Class {
	#name : #SmaCCErrorSymbolNode,
	#superclass : #SmaCCSymbolNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCErrorSymbolNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitErrorSymbol: self
]

{ #category : #generated }
SmaCCErrorSymbolNode >> name [
	^ name
]

{ #category : #generated }
SmaCCErrorSymbolNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCErrorSymbolNode >> tokenVariables [
	^ #(#name #variableNameToken)
]
