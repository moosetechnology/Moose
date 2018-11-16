Class {
	#name : #SmaCCTokenSymbolNode,
	#superclass : #SmaCCSymbolNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCTokenSymbolNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitTokenSymbol: self
]

{ #category : #generated }
SmaCCTokenSymbolNode >> name [
	^ name
]

{ #category : #generated }
SmaCCTokenSymbolNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCTokenSymbolNode >> tokenVariables [
	^ #(#name #variableNameToken)
]
