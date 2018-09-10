"
This class compiles XPath expressions. It first parses them to an intermediate representation, optimizes it, translates it to Smalltalk source code, and then compiles the translated source code using the system's compiler and returns the result as an evaluable XPathCompiledExpression object.
"
Class {
	#name : #XPathExpressionCompiler,
	#superclass : #Object,
	#classVars : [
		'SystemCompilerClass'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #compiling }
XPathExpressionCompiler class >> compileExpression: anExpressionSourceStringOrStream [
	^ self new compileExpression: anExpressionSourceStringOrStream
]

{ #category : #accessing }
XPathExpressionCompiler class >> systemCompilerClass [
	^ SystemCompilerClass
		ifNil: [
			"On Pharo/Squeak, Behavior class>>#compilerClass returns the  platform's
			preferred compiler class that can be sent #evaluate: to compile a
			string. On GS, any object can be sent #evaluate: to compile a string."
			SystemCompilerClass :=
				(Behavior respondsTo: #compilerClass)
					ifTrue: [Behavior compilerClass]
					ifFalse: [Behavior]]
]

{ #category : #accessing }
XPathExpressionCompiler class >> systemCompilerClass: aClass [
	SystemCompilerClass := aClass
]

{ #category : #compiling }
XPathExpressionCompiler >> compileExpression: anExpressionSourceStringOrStream [
	^ self compileTranslatedExpression:
		(self translateParsedExpression:
			(self optimizeParsedExpression:
				(self parseExpression: anExpressionSourceStringOrStream)))
]

{ #category : #translating }
XPathExpressionCompiler >> compileTranslatedExpression: aTranslatedExpression [
	^ XPathCompiledExpression
		block:
			(self class systemCompilerClass evaluate:
				aTranslatedExpression sourceCode)
		nodeTests: aTranslatedExpression nodeTests
]

{ #category : #optimizing }
XPathExpressionCompiler >> optimizeParsedExpression: anExpressionAST [
	^ self optimizerClass new
		visitNode: anExpressionAST
]

{ #category : #defaults }
XPathExpressionCompiler >> optimizerClass [
	^ XPathASTOptimizingMutatingNodeVisitor
]

{ #category : #parsing }
XPathExpressionCompiler >> parseExpression: anExpressionSourceStringOrStream [
	^ (self parserClass
		on: anExpressionSourceStringOrStream
		for: self parserHandlerClass new) parse
]

{ #category : #defaults }
XPathExpressionCompiler >> parserClass [
	^ XPathExpressionParser
]

{ #category : #defaults }
XPathExpressionCompiler >> parserHandlerClass [
	^ XPathASTExpressionParserHandler
]

{ #category : #translating }
XPathExpressionCompiler >> translateParsedExpression: anExpressionAST [
	^ self translatorClass new
		visitNode: anExpressionAST;
		translatedExpression
]

{ #category : #defaults }
XPathExpressionCompiler >> translatorClass [
	^ XPathASTTranslatingWritingNodeVisitor
]
