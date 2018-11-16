Class {
	#name : #Antlr4DelegateGrammarNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'aliasNameToken',
		'equal',
		'nameToken'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4DelegateGrammarNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitDelegateGrammar: self
]

{ #category : #generated }
Antlr4DelegateGrammarNode >> aliasNameToken [
	^ aliasNameToken
]

{ #category : #generated }
Antlr4DelegateGrammarNode >> aliasNameToken: aSmaCCToken [
	aliasNameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4DelegateGrammarNode >> equal [
	^ equal
]

{ #category : #generated }
Antlr4DelegateGrammarNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
Antlr4DelegateGrammarNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4DelegateGrammarNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4DelegateGrammarNode >> tokenVariables [
	^ #(#aliasNameToken #equal #nameToken)
]
