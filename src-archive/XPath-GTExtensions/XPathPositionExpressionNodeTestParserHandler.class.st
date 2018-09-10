"
This class forwards position handler messages to an XPathPositionExpressionParserHandler.
"
Class {
	#name : #XPathPositionExpressionNodeTestParserHandler,
	#superclass : #XPathExpressionNodeTestParserHandler,
	#category : #'XPath-GTExtensions-Highlighting-Parsers'
}

{ #category : #'handling - positions' }
XPathPositionExpressionNodeTestParserHandler >> handleEndArgumentPosition: aPosition [
	expressionParserHandler handleEndArgumentPosition: aPosition
]

{ #category : #'handling - positions' }
XPathPositionExpressionNodeTestParserHandler >> handleEndFunctionCallPosition: aPosition [
	expressionParserHandler handleEndFunctionCallPosition: aPosition
]

{ #category : #'handling - positions' }
XPathPositionExpressionNodeTestParserHandler >> handleEndNodeTestPosition: aPosition [
	expressionParserHandler handleEndNodeTestPosition: aPosition
]

{ #category : #'handling - positions' }
XPathPositionExpressionNodeTestParserHandler >> handleStartArgumentPosition: aPosition [
	expressionParserHandler handleStartArgumentPosition: aPosition
]

{ #category : #'handling - positions' }
XPathPositionExpressionNodeTestParserHandler >> handleStartFunctionCallPosition: aPosition [
	expressionParserHandler handleStartFunctionCallPosition: aPosition
]

{ #category : #'handling - positions' }
XPathPositionExpressionNodeTestParserHandler >> handleStartNodeTestPosition: aPosition [
	expressionParserHandler handleStartNodeTestPosition: aPosition
]
