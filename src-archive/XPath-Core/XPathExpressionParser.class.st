"
This class parses XPath expressions. It understands all of XPath 1.0 syntax and supports some extensions like the attribute(), element(), and namespace() type tests that can optionally have name test arguments, and name tests like 'Q{NamespaceURI}localName', '*:localName', and 'Q{NamespaceURI}*'.
"
Class {
	#name : #XPathExpressionParser,
	#superclass : #XPathParser,
	#instVars : [
		'currentAxis',
		'nodeTestParser'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #testing }
XPathExpressionParser >> atDigit [
	readStream peek
		ifNil: [^ false]
		ifNotNil: [:nextChar | ^ nextChar isDigit]
]

{ #category : #private }
XPathExpressionParser >> errorExpectedEndPredicate [
	self errorExpected: '"]" end of predicate'
]

{ #category : #private }
XPathExpressionParser >> errorExpectedNodeTest [
	self errorExpected: 'node test after axis'
]

{ #category : #private }
XPathExpressionParser >> errorExpectedStep [
	self errorExpected: 'location path step'
]

{ #category : #parsing }
XPathExpressionParser >> nextAdditionalSteps [
	self peekForAdditionalSteps
		ifFalse: [self errorExpectedStep]
]

{ #category : #parsing }
XPathExpressionParser >> nextAdditiveExpression [
	handler handleStartAdditiveExpression.
	self nextMultiplicativeExpression.
	[self peekForAdditiveOperator]
		whileTrue: [self nextMultiplicativeExpression].
	handler handleEndAdditiveExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextAndExpression [
	handler handleStartAndExpression.
	self nextEqualityExpression.
	[self peekForAndOperator]
		whileTrue: [
			handler handleAndOperator.
			self nextEqualityExpression].
	handler handleEndAndExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextArgument [
	handler handleStartFunctionArgument.
	self nextOrExpression.
	handler handleEndFunctionArgument.
]

{ #category : #parsing }
XPathExpressionParser >> nextDigitsOnWriteStream [
	"first digit"
	writeStream nextPut: readStream next.
	[self atDigit]
		whileTrue: [writeStream nextPut: readStream next].
]

{ #category : #parsing }
XPathExpressionParser >> nextEqualityExpression [
	handler handleStartEqualityExpression.
	self nextRelationalExpression.
	[self peekForEqualityOperator]
		whileTrue: [self nextRelationalExpression].
	handler handleEndEqualityExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextFilterExpression [
	handler handleStartFilterExpression.
	self
		nextPrimaryExpression;
		peekForPredicates.
	handler handleEndFilterExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextFunctionCall [
	handler handleStartFunctionCall: self nextName.
	self nextArgumentList.
	handler handleEndFunctionCall.
]

{ #category : #parsing }
XPathExpressionParser >> nextMultiplicativeExpression [
	handler handleStartMultiplicativeExpression.
	self nextUnaryExpression.
	[self peekForMultiplicativeOperator]
		whileTrue: [self nextUnaryExpression].
	handler handleEndMultiplicativeExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextOrExpression [
	handler handleStartOrExpression.
	self nextAndExpression.
	[self peekForOrOperator]
		whileTrue: [
			handler handleOrOperator.
			self nextAndExpression].
	handler handleEndOrExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextPathExpression [
	handler handleStartPathExpression.
	self peekForLocationPathExpression
		ifFalse: [
			self
				nextFilterExpression;
				peekForFilterExpressionLocationPath].
	handler handleEndPathExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextPredicateBody [
	handler handleStartPredicate.
	self nextOrExpression.
	self peekForEndPredicate
		ifFalse: [self errorExpectedEndPredicate].
	handler handleEndPredicate.
]

{ #category : #parsing }
XPathExpressionParser >> nextPrimaryExpression [
	readStream skipSeparators.
	(self peekForVariableReference
		or: [self peekForParenthesizedExpression
			or: [self peekForStringLiteral
				or: [self peekForNumberLiteral]]])
		ifFalse: [self nextFunctionCall].
]

{ #category : #parsing }
XPathExpressionParser >> nextRelationalExpression [
	handler handleStartRelationalExpression.
	self nextAdditiveExpression.
	[self peekForRelationalOperator]
		whileTrue: [self nextAdditiveExpression].
	handler handleEndRelationalExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextUnaryExpression [
	handler handleStartUnaryExpression.
	[self peekForNegationOperator]
		whileTrue: [handler handleNegationOperator].
	self nextUnionExpression.
	handler handleEndUnaryExpression.
]

{ #category : #parsing }
XPathExpressionParser >> nextUnionExpression [
	handler handleStartUnionExpression.
	self nextPathExpression.
	[self peekForUnionOperator]
		whileTrue: [self nextPathExpression].
	handler handleEndUnionExpression.
]

{ #category : #private }
XPathExpressionParser >> nodeTestParserClass [
	^ XPathNodeTestParser
]

{ #category : #private }
XPathExpressionParser >> nodeTestParserHandlerClass [
	^ XPathExpressionNodeTestParserHandler
]

{ #category : #parsing }
XPathExpressionParser >> parseInput [
	currentAxis := XPathExpressionParserAxis new.
	nodeTestParser :=
		self nodeTestParserClass
			on: readStream
			for:
				(self nodeTestParserHandlerClass
					currentAxis: currentAxis
					expressionParserHandler: handler).

	self nextOrExpression.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAbbreviatedAxis [
	(readStream peekFor: $@)
		ifTrue: [
			currentAxis axisSpecifier: 'attribute'.
			^ true]
		ifFalse: [^ false]
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAbbreviatedDescendantStep [
	(readStream peekFor: $/)
		ifFalse: [^ false].

	currentAxis axisSpecifier: 'descendant-or-self'.
	self startNodeTestForAnyNodeType.
	self peekForStep
		ifFalse: [self errorExpectedStep].
	^ true.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAbbreviatedStep [
	(readStream peekFor: $.)
		ifFalse: [^ false].
	self atDigit
		ifTrue: [
			"a float literal, not a . or .. step"
			readStream skipBack.
			^ false].

	(readStream peekFor: $.)
		ifTrue: [currentAxis axisSpecifier: 'parent']
		ifFalse: [currentAxis axisSpecifier: 'self'].
	"abbreviated steps cannot have filters"
	self startNodeTestForAnyNodeType.
	^ true.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAbsoluteLocationPath [
	self peekForLocationPathSeparator
		ifFalse: [^ false].

	handler handleStartAbsoluteLocationPath.
	currentAxis
		beDefaultImplicitAxis;
		beFirstAxis.
	self peekForAdditionalSteps
		ifFalse: [
			currentAxis axisSpecifier: 'self'.
			self startNodeTestForAnyNodeType].
	handler handleEndLocationPath.
	^ true.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAdditionalSteps [
	(self peekForAbbreviatedDescendantStep
		or: [self peekForStep])
		ifFalse: [^ false].
	[self peekForLocationPathSeparator]
		whileTrue: [
			(self peekForAbbreviatedDescendantStep
				or: [self peekForStep])
				ifFalse: [self errorExpectedStep]].
	^ true.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAdditiveOperator [
	readStream skipSeparators.
	(readStream peekFor: $+)
		ifTrue: [
			handler handleAdditionOperator.
			^ true].
	(readStream peekFor: $-)
		ifTrue: [
			handler handleSubtractionOperator.
			^ true].
	^ false.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAndOperator [
	^ readStream
		skipSeparators;
		peekForNCName: 'and'
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForAxis [
	| startPosition ncName |

	self peekForAbbreviatedAxis
		ifTrue: [^ true].
	startPosition := readStream position.
	(ncName := self nextNCNameOptional: true)
		ifNil: [^ false].
	readStream skipSeparators.
	((readStream peekFor: $:)
		and: [readStream peekFor: $:])
		ifFalse: [
			readStream
				pushBackNCName: ncName
				position: startPosition.
			^ false].
	currentAxis axisSpecifier: ncName.
	^ true.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForEndPredicate [
	^ readStream
		skipSeparators;
		peekFor: $]
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForEqualityOperator [
	readStream skipSeparators.
	(readStream peekFor: $!)
		ifTrue: [
			self expectNext: $=.
			handler handleNotEqualsOperator.
			^ true].
	(readStream peekFor: $=)
		ifTrue: [
			handler handleEqualsOperator.
			^ true].
	^ false.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForFilterExpressionLocationPath [
	self peekForLocationPathSeparator
		ifTrue: [
			handler handleStartFilterExpressionLocationPath.
			self nextAdditionalSteps.
			handler handleEndLocationPath.
			^ true]
		ifFalse: [^ false]
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForLocationPathExpression [
	^ self peekForAbsoluteLocationPath
		or: [self peekForRelativeLocationPath]
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForLocationPathSeparator [
	^ readStream
		skipSeparators;
		peekFor: $/
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForMultiplicativeOperator [
	readStream skipSeparators.
	readStream atEnd
		ifTrue: [^ false].
	(readStream peekFor: $*)
		ifTrue: [
			handler handleMultiplicationOperator.
			^ true].
	(readStream peekForNCName: 'div')
		ifTrue: [
			handler handleDivisionOperator.
			^ true].
	(readStream peekForNCName: 'mod')
		ifTrue: [
			handler handleModulusOperator.
			^ true].
	^ false.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForNegationOperator [
	^ readStream
		skipSeparators;
		peekFor: $-
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForNodeTest [
	^ nodeTestParser parse
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForNumberLiteral [
	| startPosition |

	startPosition := readStream position.
	writeStream reset.
	self atDigit
		ifTrue: [
			self nextDigitsOnWriteStream.
			(readStream peekFor: $.)
				ifTrue: [
					writeStream nextPut: $..
					self atDigit
						ifTrue: [self nextDigitsOnWriteStream]].
			handler handleNumberLiteral: writeStream contents.
			^ true].
	((readStream peekFor: $.)
		and: [self atDigit])
		ifTrue: [
			writeStream nextPut: $..
			self nextDigitsOnWriteStream.
			handler handleNumberLiteral: writeStream contents.
			^ true].
	readStream position: startPosition.
	^ false.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForOrOperator [
	^ readStream
		skipSeparators;
		peekForNCName: 'or'
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForParenthesizedExpression [
	(readStream peekFor: $()
		ifFalse: [^ false].

	self nextOrExpression.
	readStream skipSeparators.
	self expectNext: $).
	^ true.

]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForPredicate [
	self peekForStartPredicate
		ifTrue: [
			self nextPredicateBody.
			^ true]
		ifFalse: [^ false]
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForPredicates [
	self peekForStartPredicate
		ifFalse: [^ false].
	handler handleStartPredicates.
	self nextPredicateBody.
	[self peekForPredicate] whileTrue.
	handler handleEndPredicates.
	^ true.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForRelationalOperator [
	readStream skipSeparators.
	(readStream peekFor: $<)
		ifTrue: [
			(readStream peekFor: $=)
				ifTrue: [handler handleLessThanOrEqualToOperator]
				ifFalse: [handler handleLessThanOperator].
			^ true].
	(readStream peekFor: $>)
		ifTrue: [
			(readStream peekFor: $=)
				ifTrue: [handler handleGreaterThanOrEqualToOperator]
				ifFalse: [handler handleGreaterThanOperator].
			^ true].
	^ false.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForRelativeLocationPath [
	currentAxis
		beDefaultImplicitAxis;
		beFirstAxis;
		beStartOfRelativeLocationPath.
	self peekForStep
		ifFalse: [^ false].
	self peekForLocationPathSeparator
		ifTrue: [self nextAdditionalSteps].
	handler handleEndLocationPath.
	^ true.
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForStartPredicate [
	^ readStream
		skipSeparators;
		peekFor: $[
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForStep [
	readStream skipSeparators.
	readStream atEnd
		ifTrue: [^ false].

	self peekForAbbreviatedStep
		ifTrue: [^ true].

	self peekForAxis.
	self peekForNodeTest
		ifTrue: [
			self peekForPredicates.
			handler handleEndStep.
			^ true]
		ifFalse: [
			currentAxis isImplicitAxis
				ifFalse: [self errorExpectedNodeTest].
			currentAxis beDefaultImplicitAxis.
			^ false].
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForStringLiteral [
	(self nextStringLiteralOptional: true)
		ifNil: [^ false]
		ifNotNil: [:string |
			handler handleStringLiteral: string.
			^ true]
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForUnionOperator [
	readStream skipSeparators.
	(readStream peekFor: $|)
		ifTrue: [
			handler handleUnionOperator.
			^ true]
		ifFalse: [^ false]
]

{ #category : #'parsing - peeking' }
XPathExpressionParser >> peekForVariableReference [
	(readStream peekFor: $$)
		ifTrue: [
			handler handleVariableReference: self nextName.
			^ true]
		ifFalse: [^ false]
]

{ #category : #private }
XPathExpressionParser >> startNodeTestForAnyNodeType [
	currentAxis isStartOfRelativeLocationPath
		ifTrue: [handler handleStartRelativeLocationPath].
	handler
		handleStartStep;
		perform: currentAxis handlerSelector;
		handleAnyNodeTest;
		handleEndStep.
	currentAxis beDefaultImplicitAxis.
]
