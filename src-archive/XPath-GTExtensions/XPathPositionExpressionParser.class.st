"
This class is an XPath expression parser that tracks the start and end positions of certain XPath constructs.
"
Class {
	#name : #XPathPositionExpressionParser,
	#superclass : #XPathExpressionParser,
	#category : #'XPath-GTExtensions-Highlighting-Parsers'
}

{ #category : #accessing }
XPathPositionExpressionParser >> currentPosition [
	^ readStream position
]

{ #category : #parsing }
XPathPositionExpressionParser >> nextArgument [
	handler handleStartArgumentPosition: self currentPosition + 1.
	super nextArgument.
	handler handleEndArgumentPosition: self currentPosition.
]

{ #category : #parsing }
XPathPositionExpressionParser >> nextFunctionCall [
	handler handleStartFunctionCallPosition: self currentPosition + 1.
	super nextFunctionCall.
	handler handleEndFunctionCallPosition: self currentPosition.
]

{ #category : #private }
XPathPositionExpressionParser >> nodeTestParserClass [
	^ XPathPositionNodeTestParser
]

{ #category : #private }
XPathPositionExpressionParser >> nodeTestParserHandlerClass [
	^ XPathPositionExpressionNodeTestParserHandler
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForAbbreviatedStep [
	^ self
		peekWith: [super peekForAbbreviatedStep]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartAxisPosition: startPosition;
				handleEndAxisPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForAdditiveOperator [
	^ self
		peekWith: [super peekForAdditiveOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForAndOperator [
	^ self
		peekWith: [super peekForAndOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForAxis [
	^ self
		peekWith: [super peekForAxis]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartAxisPosition: startPosition;
				handleEndAxisPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForEndPredicate [
	super peekForEndPredicate
		ifTrue: [
			handler handleEndPredicatePosition: self currentPosition.
			^ true]
		ifFalse: [^ false]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForEqualityOperator [
	^ self
		peekWith: [super peekForEqualityOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForMultiplicativeOperator [
	^ self
		peekWith: [super peekForMultiplicativeOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForNegationOperator [
	^ self
		peekWith: [super peekForNegationOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForNumberLiteral [
	^ self
		peekWith: [super peekForNumberLiteral]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartNumberLiteralPosition: startPosition;
				handleEndNumberLiteralPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForOrOperator [
	^ self
		peekWith: [super peekForOrOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForRelationalOperator [
	^ self
		peekWith: [super peekForRelationalOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForStartPredicate [
	super peekForStartPredicate
		ifTrue: [
			handler handleStartPredicatePosition: self currentPosition.
			^ true]
		ifFalse: [^ false]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForStringLiteral [
	^ self
		peekWith: [super peekForStringLiteral]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartStringLiteralPosition: startPosition;
				handleEndStringLiteralPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForUnionOperator [
	^ self
		peekWith: [super peekForUnionOperator]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartOperatorPosition: startPosition;
				handleEndOperatorPosition: endPosition]
]

{ #category : #'parsing - peeking' }
XPathPositionExpressionParser >> peekForVariableReference [
	^ self
		peekWith: [super peekForVariableReference]
		startAndEndPositionsDo: [:startPosition :endPosition |
			handler
				handleStartVariableReferencePosition: startPosition;
				handleEndVariableReferencePosition: endPosition]
]

{ #category : #private }
XPathPositionExpressionParser >> peekWith: aFirstBlock startAndEndPositionsDo: aSecondBlock [
	| oldPosition |

	oldPosition := self currentPosition.
	aFirstBlock value
		ifTrue: [
			aSecondBlock
				cull: oldPosition + 1
				cull: self currentPosition.
			^ true]
		ifFalse: [^ false].
]
