"
This class is a highlighting handler for XPathPositionExpressionParsers that returns the parsed expression source as a highlighted Text object.
"
Class {
	#name : #XPathHighlightingPositionExpressionParserHandler,
	#superclass : #XPathPositionExpressionParserHandler,
	#instVars : [
		'highlighter',
		'expressionSource'
	],
	#category : #'XPath-GTExtensions-Highlighting-Parsers'
}

{ #category : #'instance creation' }
XPathHighlightingPositionExpressionParserHandler class >> expressionSource: anExpression [
	^ self new expressionSource: anExpression
]

{ #category : #converting }
XPathHighlightingPositionExpressionParserHandler >> asHighlightedText [
	| text |

	text := self expressionSource asText.
	highlighter highlightText: text.
	^ text.
]

{ #category : #converting }
XPathHighlightingPositionExpressionParserHandler >> asHighlightedTextColored: aTextColor startingAt: aPosition [
	| text |

	text := self asHighlightedText.
	highlighter
		highlightText: text
		withColor: aTextColor
		startingAt: aPosition.
	^ text.
]

{ #category : #accessing }
XPathHighlightingPositionExpressionParserHandler >> expressionSource [
	^ expressionSource ifNil: [expressionSource := '']
]

{ #category : #accessing }
XPathHighlightingPositionExpressionParserHandler >> expressionSource: anExpressionSourceString [
	expressionSource := anExpressionSourceString
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndArgumentPosition: aPosition [
	highlighter startFunctionCallHighlightPosition: aPosition + 1
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndAxisPosition: aPosition [
	highlighter endAxisHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndFunctionCallPosition: aPosition [
	highlighter endFunctionCallHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndNodeTestPosition: aPosition [
	highlighter endNodeTestHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndNumberLiteralPosition: aPosition [
	highlighter endNumberLiteralHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndOperatorPosition: aPosition [
	highlighter endOperatorHighlightPosition: aPosition
]

{ #category : #handling }
XPathHighlightingPositionExpressionParserHandler >> handleEndParsing [
	self parsingResult: self asHighlightedText
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndPredicatePosition: aPosition [
	highlighter
		decrementPredicateColorLevel;
		startPredicateHighlightPosition: aPosition;
		endPredicateHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndStringLiteralPosition: aPosition [
	highlighter endStringLiteralHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleEndVariableReferencePosition: aPosition [
	highlighter endVariableReferenceHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartArgumentPosition: aPosition [
	highlighter endFunctionCallHighlightPosition: aPosition - 1
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartAxisPosition: aPosition [
	highlighter startAxisHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartFunctionCallPosition: aPosition [
	highlighter startFunctionCallHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartNodeTestPosition: aPosition [
	highlighter startNodeTestHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartNumberLiteralPosition: aPosition [
	highlighter startNumberLiteralHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartOperatorPosition: aPosition [
	highlighter startOperatorHighlightPosition: aPosition
]

{ #category : #handling }
XPathHighlightingPositionExpressionParserHandler >> handleStartParsing [
	highlighter := XPathExpressionHighlighter new
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartPredicatePosition: aPosition [
	highlighter
		startPredicateHighlightPosition: aPosition;
		endPredicateHighlightPosition: aPosition;
		incrementPredicateColorLevel
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartStringLiteralPosition: aPosition [
	highlighter startStringLiteralHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XPathHighlightingPositionExpressionParserHandler >> handleStartVariableReferencePosition: aPosition [
	highlighter startVariableReferenceHighlightPosition: aPosition
]

{ #category : #accessing }
XPathHighlightingPositionExpressionParserHandler >> highlighter [
	^ highlighter
]
