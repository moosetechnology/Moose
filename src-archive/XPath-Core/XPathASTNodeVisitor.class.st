"
This is a base class for AST visitors.
"
Class {
	#name : #XPathASTNodeVisitor,
	#superclass : #Object,
	#instVars : [
		'argumentIterator',
		'predicateIterator',
		'stepIterator'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #private }
XPathASTNodeVisitor >> argumentIterator [
	^ argumentIterator
		ifNil: [argumentIterator := XPathASTNodeVisitorIterator null]
]

{ #category : #iterating }
XPathASTNodeVisitor >> nextArgument [
	^ self argumentIterator next
]

{ #category : #iterating }
XPathASTNodeVisitor >> nextPredicate [
	^ self predicateIterator next
]

{ #category : #iterating }
XPathASTNodeVisitor >> nextStep [
	^ self stepIterator next
]

{ #category : #iterating }
XPathASTNodeVisitor >> peekArgument [
	^ self argumentIterator peek
]

{ #category : #iterating }
XPathASTNodeVisitor >> peekPredicate [
	^ self predicateIterator peek
]

{ #category : #iterating }
XPathASTNodeVisitor >> peekStep [
	^ self stepIterator peek
]

{ #category : #private }
XPathASTNodeVisitor >> predicateIterator [
	^ predicateIterator
		ifNil: [predicateIterator := XPathASTNodeVisitorIterator null]
]

{ #category : #iterating }
XPathASTNodeVisitor >> previousArgument [
	^ self argumentIterator previousVisited
]

{ #category : #iterating }
XPathASTNodeVisitor >> previousPredicate [
	^ self predicateIterator previousVisited
]

{ #category : #iterating }
XPathASTNodeVisitor >> previousStep [
	^ self stepIterator previousVisited
]

{ #category : #private }
XPathASTNodeVisitor >> stepIterator [
	^ stepIterator
		ifNil: [stepIterator := XPathASTNodeVisitorIterator null]
]

{ #category : #'visiting - location paths' }
XPathASTNodeVisitor >> visitAbsoluteLocationPath: anAbsoluteLocationPath [
	^ self visitLocationPath: anAbsoluteLocationPath
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitAdditionExpression: anAdditionExpression [
	^ self visitBinaryOperatorExpression: anAdditionExpression
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitAncestorOrSelfStep: anAncestorOrSelfStep [
	^ self visitStep: anAncestorOrSelfStep
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitAncestorStep: anAncestorStep [
	^ self visitStep: anAncestorStep
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitAndExpression: anAndExpression [
	^ self visitBinaryOperatorExpression: anAndExpression
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAnyNodeTest: anAnyNodeTest [
	^ self visitNodeTest: anAnyNodeTest
]

{ #category : #'visiting - functions' }
XPathASTNodeVisitor >> visitArgument: aNode [
	^ self visitNodeWithExpression: aNode
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAttributeNodeTest: anAttributeNodeTest [
	^ self visitNodeTest: anAttributeNodeTest
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAttributeNodeTestForLocalName: anAttributeNodeTestForLocalName [
	^ self visitNodeTest: anAttributeNodeTestForLocalName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAttributeNodeTestForName: anAttributeTestForName [
	^ self visitNodeTest: anAttributeTestForName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAttributeNodeTestForNamespaceURI: anAttributeNodeTestForNamespaceURI [
	^ self visitNodeTest: anAttributeNodeTestForNamespaceURI
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAttributeNodeTestForNamespaceURIAndLocalName: anAttributeNodeTestForNamespaceURIAndLocalName [
	^ self visitNodeTest: anAttributeNodeTestForNamespaceURIAndLocalName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAttributeNodeTestForPrefix: anAttributeNodeTestForPrefix [
	^ self visitNodeTest: anAttributeNodeTestForPrefix
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitAttributeNodeTestForPrefixAndLocalName: anAttributeNodeTestForPrefixAndLocalName [
	^ self visitNodeTest: anAttributeNodeTestForPrefixAndLocalName
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitAttributeStep: anAttributeStep [
	^ self visitStep: anAttributeStep
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitBinaryOperatorExpression: aBinaryOperatorExpression [
	^ self visitNodeWithOtherExpression: aBinaryOperatorExpression
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitChildStep: aChildStep [
	^ self visitStep: aChildStep
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitCommentNodeTest: aCommentNodeTest [
	^ self visitNodeTest: aCommentNodeTest
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitDescendantOrSelfStep: aDescendantOrSelfStep [
	^ self visitStep: aDescendantOrSelfStep
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitDescendantStep: aDescendantStep [
	^ self visitStep: aDescendantStep
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitDivisionExpression: aDivisionExpression [
	^ self visitBinaryOperatorExpression: aDivisionExpression
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitElementNodeTest: anElementNodeTest [
	^ self visitNodeTest: anElementNodeTest
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitElementNodeTestForLocalName: anElementNodeTestForLocalName [
	^ self visitNodeTest: anElementNodeTestForLocalName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitElementNodeTestForName: anElementNodeTestForName [
	^ self visitNodeTest: anElementNodeTestForName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitElementNodeTestForNamespaceURI: anElementNodeTestForNamespaceURI [
	^ self visitNodeTest: anElementNodeTestForNamespaceURI
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitElementNodeTestForNamespaceURIAndLocalName: anElementNodeTestForNamespaceURIAndLocalName [
	^ self visitNodeTest: anElementNodeTestForNamespaceURIAndLocalName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitElementNodeTestForPrefix: anElementNodeTestForPrefix [
	^ self visitNodeTest: anElementNodeTestForPrefix
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitElementNodeTestForPrefixAndLocalName: anElementNodeTestForPrefixAndLocalName [
	^ self visitNodeTest: anElementNodeTestForPrefixAndLocalName
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitEqualsExpression: anEqualsExpression [
	^ self visitBinaryOperatorExpression: anEqualsExpression
]

{ #category : #visiting }
XPathASTNodeVisitor >> visitExpressionRoot: anExpressionRoot [
	^ self visitNodeWithExpression: anExpressionRoot
]

{ #category : #'visiting - location paths' }
XPathASTNodeVisitor >> visitFilterExpression: aFilterExpression [
	^ self
		visitNodeWithExpression: aFilterExpression;
		visitFilterable: aFilterExpression
]

{ #category : #'visiting - location paths' }
XPathASTNodeVisitor >> visitFilterExpressionLocationPath: aFilterExpressionLocationPath [
	^ self
		visitNodeWithExpression: aFilterExpressionLocationPath;
		visitLocationPath: aFilterExpressionLocationPath
]

{ #category : #'visiting - location paths' }
XPathASTNodeVisitor >> visitFilterable: aFilterable [
	aFilterable hasPredicates
		ifTrue: [| oldPredicateIterator |
			oldPredicateIterator := predicateIterator.
			predicateIterator :=
				XPathASTNodeVisitorIterator on: aFilterable predicates.
			[predicateIterator atEnd]
				whileFalse: [predicateIterator visitNextWith: self].
			predicateIterator := oldPredicateIterator].
	^ aFilterable.
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitFollowingSiblingStep: aFollowingSiblingStep [
	^ self visitStep: aFollowingSiblingStep
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitFollowingStep: aFollowingStep [
	^ self visitStep: aFollowingStep
]

{ #category : #'visiting - functions' }
XPathASTNodeVisitor >> visitFunctionCall: aFunctionCall [
	aFunctionCall hasArguments
		ifTrue: [| oldArgumentIterator |
			oldArgumentIterator := argumentIterator.
			argumentIterator :=
				XPathASTNodeVisitorIterator on: aFunctionCall arguments.
			[argumentIterator atEnd]
				whileFalse: [argumentIterator visitNextWith: self].
			argumentIterator := oldArgumentIterator].
	^ aFunctionCall.
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitGreaterThanExpression: aGreaterThanExpression [
	^ self visitBinaryOperatorExpression: aGreaterThanExpression
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitGreaterThanOrEqualToExpression: aGreaterThanOrEqualToExpression [
	^ self visitBinaryOperatorExpression: aGreaterThanOrEqualToExpression
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitLessThanExpression: aLessThanExpression [
	^ self visitBinaryOperatorExpression: aLessThanExpression
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitLessThanOrEqualToExpression: aLessThanOrEqualToExpression [
	^ self visitBinaryOperatorExpression: aLessThanOrEqualToExpression
]

{ #category : #'visiting - location paths' }
XPathASTNodeVisitor >> visitLocationPath: aLocationPath [
	aLocationPath hasSteps
		ifTrue: [| oldStepIterator |
			oldStepIterator := stepIterator.
			stepIterator := XPathASTNodeVisitorIterator on: aLocationPath steps.
			[stepIterator atEnd]
				whileFalse: [stepIterator visitNextWith: self].
			stepIterator := oldStepIterator].
	^ aLocationPath.
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitModulusExpression: aModulusExpression [
	^ self visitBinaryOperatorExpression: aModulusExpression
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitMultiplicationExpression: aMultiplicationExpression [
	^ self visitBinaryOperatorExpression: aMultiplicationExpression
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNamespaceNodeTest: aNamespaceNodeTest [
	^ self visitNodeTest: aNamespaceNodeTest
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNamespaceNodeTestForLocalName: aNamespaceNodeTestForLocalName [
	^ self visitNodeTest: aNamespaceNodeTestForLocalName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNamespaceNodeTestForName: aNamespaceNodeTestForName [
	^ self visitNodeTest: aNamespaceNodeTestForName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNamespaceNodeTestForNamespaceURI: aNamespaceNodeTestForNamespaceURI [
	^ self visitNodeTest: aNamespaceNodeTestForNamespaceURI
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNamespaceNodeTestForNamespaceURIAndLocalName: aNamespaceNodeTestForNamespaceURIAndLocalName [
	^ self visitNodeTest: aNamespaceNodeTestForNamespaceURIAndLocalName
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNamespaceNodeTestForPrefix: aNamespaceNodeTestForPrefix [
	^ self visitNodeTest: aNamespaceNodeTestForPrefix
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNamespaceNodeTestForPrefixAndLocalName: aNamespaceTestForPrefixAndLocalName [
	^ self visitNodeTest: aNamespaceTestForPrefixAndLocalName
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitNamespaceStep: aNamespaceStep [
	^ self visitStep: aNamespaceStep
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitNegationExpression: aNegationExpression [
	^ self visitUnaryOperatorExpression: aNegationExpression
]

{ #category : #visiting }
XPathASTNodeVisitor >> visitNode: aNode [
	^ aNode acceptNodeVisitor: self
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitNodeTest: aNodeTest [
	^ aNodeTest
]

{ #category : #visiting }
XPathASTNodeVisitor >> visitNodeWithExpression: aNodeWithExpression [
	aNodeWithExpression expression acceptNodeVisitor: self.
	^ aNodeWithExpression.
]

{ #category : #visiting }
XPathASTNodeVisitor >> visitNodeWithOtherExpression: aNodeWithOtherExpression [
	self visitNodeWithExpression: aNodeWithOtherExpression.
	aNodeWithOtherExpression otherExpression acceptNodeVisitor: self.
	^ aNodeWithOtherExpression.
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitNotEqualsExpression: aNotEqualsExpression [
	^ self visitBinaryOperatorExpression: aNotEqualsExpression
]

{ #category : #'visiting - literals' }
XPathASTNodeVisitor >> visitNumberLiteral: aNumberLiteral [
	^ aNumberLiteral
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitOrExpression: anOrExpression [
	^ self visitBinaryOperatorExpression: anOrExpression
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitPINodeTest: aPINodeTest [
	^ self visitNodeTest: aPINodeTest
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitPINodeTestForName: aPINodeTestForName [
	^ self visitNodeTest: aPINodeTestForName
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitParentStep: aParentStep [
	^ self visitStep: aParentStep
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitPrecedingSiblingStep: aPrecedingSiblingStep [
	^ self visitStep: aPrecedingSiblingStep
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitPrecedingStep: aPrecedingStep [
	^ self visitStep: aPrecedingStep
]

{ #category : #'visiting - predicates' }
XPathASTNodeVisitor >> visitPredicate: aPredicate [
	^ self visitNodeWithExpression: aPredicate
]

{ #category : #'visiting - location paths' }
XPathASTNodeVisitor >> visitRelativeLocationPath: aRelativeLocationPath [
	^ self visitLocationPath: aRelativeLocationPath
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitSelfStep: aSelfStep [
	^ self visitStep: aSelfStep
]

{ #category : #'visiting - steps' }
XPathASTNodeVisitor >> visitStep: aStep [
	aStep nodeTest acceptNodeVisitor: self.
	^ self visitFilterable: aStep.
]

{ #category : #'visiting - literals' }
XPathASTNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ aStringLiteral
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitSubtractionExpression: aSubtractionExpression [
	^ self visitBinaryOperatorExpression: aSubtractionExpression
]

{ #category : #'visiting - node tests' }
XPathASTNodeVisitor >> visitTextNodeTest: aTextNodeTest [
	^ self visitNodeTest: aTextNodeTest
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitUnaryOperatorExpression: aUnaryOperatorExpression [
	^ self visitNodeWithExpression: aUnaryOperatorExpression
]

{ #category : #'visiting - operators' }
XPathASTNodeVisitor >> visitUnionExpression: aUnionExpression [
	^ self visitBinaryOperatorExpression: aUnionExpression
]

{ #category : #'visiting - variables' }
XPathASTNodeVisitor >> visitVariableReference: aVariableReference [
	^ aVariableReference
]
