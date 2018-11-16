Class {
	#name : #Antlr4ExceptionHandlerNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'catchToken',
		'leftBracket',
		'argActionBlock',
		'rightBracket',
		'actionBlock'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ExceptionHandlerNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitExceptionHandler: self
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> actionBlock [
	^ actionBlock
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> actionBlock: anAntlr4ActionBlockNode [
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: nil ].
	actionBlock := anAntlr4ActionBlockNode.
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: self ]
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> argActionBlock [
	^ argActionBlock
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> argActionBlock: aSmaCCToken [
	argActionBlock := aSmaCCToken
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> catchToken [
	^ catchToken
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> catchToken: aSmaCCToken [
	catchToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> nodeVariables [
	^ #(#actionBlock)
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4ExceptionHandlerNode >> tokenVariables [
	^ #(#catchToken #leftBracket #argActionBlock #rightBracket)
]
