Class {
	#name : #SmaCCProductionSymbolNode,
	#superclass : #SmaCCSymbolNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCProductionSymbolNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitProductionSymbol: self
]

{ #category : #generated }
SmaCCProductionSymbolNode >> name [
	^ name
]

{ #category : #generated }
SmaCCProductionSymbolNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCProductionSymbolNode >> tokenVariables [
	^ #(#name #variableNameToken)
]
