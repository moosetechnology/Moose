Class {
	#name : #Antlr4NamespaceNameNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameTokens',
		'dots'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4NamespaceNameNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitNamespaceName: self
]

{ #category : #generated }
Antlr4NamespaceNameNode >> compositeTokenVariables [
	^ #(#nameTokens #dots)
]

{ #category : #generated }
Antlr4NamespaceNameNode >> dots [
	^ dots
]

{ #category : #generated }
Antlr4NamespaceNameNode >> dots: anOrderedCollection [
	dots := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
Antlr4NamespaceNameNode >> initialize [
	super initialize.
	nameTokens := OrderedCollection new: 2.
	dots := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4NamespaceNameNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
Antlr4NamespaceNameNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]
