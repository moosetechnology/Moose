"
An abstract class for XPath expression parser handlers.
"
Class {
	#name : #XPathExpressionParserHandler,
	#superclass : #XPathParserHandler,
	#category : #'XPath-Core-Parsers'
}

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleAdditionOperator [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleAncestorAxis [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleAncestorOrSelfAxis [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleAndOperator [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAnyNodeTest [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleAttributeAxis [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAttributeNodeTest [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAttributeNodeTestForLocalName: aLocalName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAttributeNodeTestForName: aName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI localName: aLocalName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAttributeNodeTestForPrefix: aPrefix [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleAttributeNodeTestForPrefix: aPrefix localName: aLocalName [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleChildAxis [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleCommentNodeTest [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleDescendantAxis [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleDescendantOrSelfAxis [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleDivisionOperator [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleElementNodeTest [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleElementNodeTestForLocalName: aLocalName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleElementNodeTestForName: aName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleElementNodeTestForNamespaceURI: aURI [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleElementNodeTestForNamespaceURI: aURI localName: aLocalName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleElementNodeTestForPrefix: aPrefix [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleElementNodeTestForPrefix: aPrefix localName: aLocalName [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndAdditiveExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndAndExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndEqualityExpression [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleEndFilterExpression [
]

{ #category : #'handling - functions' }
XPathExpressionParserHandler >> handleEndFunctionArgument [
]

{ #category : #'handling - functions' }
XPathExpressionParserHandler >> handleEndFunctionCall [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleEndLocationPath [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndMultiplicativeExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndOrExpression [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleEndPathExpression [
]

{ #category : #'handling - predicates' }
XPathExpressionParserHandler >> handleEndPredicate [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleEndPredicates [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndRelationalExpression [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleEndStep [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndUnaryExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEndUnionExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleEqualsOperator [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleFollowingAxis [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleFollowingSiblingAxis [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleGreaterThanOperator [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleGreaterThanOrEqualToOperator [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleLessThanOperator [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleLessThanOrEqualToOperator [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleModulusOperator [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleMultiplicationOperator [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleNamespaceAxis [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleNamespaceNodeTest [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleNamespaceNodeTestForLocalName: aLocalName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleNamespaceNodeTestForName: aName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI localName: aLocalName [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix localName: aLocalName [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleNegationOperator [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleNotEqualsOperator [
]

{ #category : #'handling - literals' }
XPathExpressionParserHandler >> handleNumberLiteral: anIntegerOrFloatString [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleOrOperator [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handlePINodeTest [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handlePINodeTestForName: aName [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleParentAxis [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handlePrecedingAxis [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handlePrecedingSiblingAxis [
]

{ #category : #'handling - axis' }
XPathExpressionParserHandler >> handleSelfAxis [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleStartAbsoluteLocationPath [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartAdditiveExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartAndExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartEqualityExpression [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleStartFilterExpression [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleStartFilterExpressionLocationPath [
]

{ #category : #'handling - functions' }
XPathExpressionParserHandler >> handleStartFunctionArgument [
]

{ #category : #'handling - functions' }
XPathExpressionParserHandler >> handleStartFunctionCall: aFunctionName [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartMultiplicativeExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartOrExpression [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleStartPathExpression [
]

{ #category : #'handling - predicates' }
XPathExpressionParserHandler >> handleStartPredicate [
]

{ #category : #'handling - predicates' }
XPathExpressionParserHandler >> handleStartPredicates [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartRelationalExpression [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleStartRelativeLocationPath [
]

{ #category : #'handling - location paths' }
XPathExpressionParserHandler >> handleStartStep [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartUnaryExpression [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleStartUnionExpression [
]

{ #category : #'handling - literals' }
XPathExpressionParserHandler >> handleStringLiteral: aString [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleSubtractionOperator [
]

{ #category : #'handling - node tests' }
XPathExpressionParserHandler >> handleTextNodeTest [
]

{ #category : #'handling - operators' }
XPathExpressionParserHandler >> handleUnionOperator [
]

{ #category : #'handling - variables' }
XPathExpressionParserHandler >> handleVariableReference: aName [
]
