"
This is a base class for XPath AST nodes. It has testing messages, messages to access the parent, and a stub node visitor accepting method.

XPath ASTs can be printed as XPath source using #printOn: or #asString.
"
Class {
	#name : #XPathASTNode,
	#superclass : #Object,
	#instVars : [
		'parent',
		'type'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #private }
XPathASTNode class >> generateTestingMethods [
	"self generateTestingMethods"

	self allSubclassesDo: [:each | | selectorString |
		selectorString := 'is', each nameWithoutPrefixAndSuffix.
		each
			compile: selectorString, '
	^ true'
			classified: #testing.
		self
			compile: selectorString, '
	^ false'
			classified: #testing]
]

{ #category : #private }
XPathASTNode class >> generateVisitingMethods [
	"self generateVisitingMethods"

	self allSubclassesDo: [:each | | nameWithoutPrefixAndSuffix |
		nameWithoutPrefixAndSuffix := each nameWithoutPrefixAndSuffix.
		each
			compile: 'acceptNodeVisitor: aNodeVisitor
	aNodeVisitor visit', nameWithoutPrefixAndSuffix, ': self'
			classified: #visiting.
		XPathASTNodeVisitor
			compile:
				'visit', nameWithoutPrefixAndSuffix, ': ',
					((nameWithoutPrefixAndSuffix first isVowel
						and: [(nameWithoutPrefixAndSuffix beginsWith: 'Un') not])
						ifTrue: ['an']
						ifFalse: ['a']), nameWithoutPrefixAndSuffix
			classified: #visiting]
]

{ #category : #private }
XPathASTNode class >> nameWithoutPrefixAndSuffix [
	^ (self name asString allButFirst: 'XPathAST' size)
		allButLast: 'Node' size
]

{ #category : #visiting }
XPathASTNode >> acceptNodeVisitor: aNodeVisitor [
	^ self
]

{ #category : #converting }
XPathASTNode >> asString [
	"returns an XPath source code string for the AST capable of being
	parsed by an XPathExpressionParser, but without potentially truncating
	it like #printString can"

	^ XPathASTSourceWritingNodeVisitor new
		visitNode: self;
		contents
]

{ #category : #private }
XPathASTNode >> beParentOf: aNode [
	aNode parent: self.
	^ aNode.
]

{ #category : #private }
XPathASTNode >> beParentOfAll: aNodeCollection [
	aNodeCollection do: [:each | self beParentOf: each].
	^ aNodeCollection.
]

{ #category : #defaults }
XPathASTNode >> defaultTypeClass [
	^ XPathValueType
]

{ #category : #testing }
XPathASTNode >> hasParent [
	^ parent notNil
		and: [parent isNull not]
]

{ #category : #testing }
XPathASTNode >> isAbsoluteLocationPath [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAdditionExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAdditiveExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAncestorOrSelfStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAncestorStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAndExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAnyNodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isArgument [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeNodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeNodeTestForLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeNodeTestForName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeNodeTestForNamespaceURI [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeNodeTestForNamespaceURIAndLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeNodeTestForPrefix [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeNodeTestForPrefixAndLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isAttributeStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isBinaryOperatorExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isChildStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isCommentNodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isDescendantOrSelfStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isDescendantStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isDivisionExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isElementNodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isElementNodeTestForLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isElementNodeTestForName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isElementNodeTestForNamespaceURI [
	^ false
]

{ #category : #testing }
XPathASTNode >> isElementNodeTestForNamespaceURIAndLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isElementNodeTestForPrefix [
	^ false
]

{ #category : #testing }
XPathASTNode >> isElementNodeTestForPrefixAndLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isEqualityExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isEqualsExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isExpressionRoot [
	^ false
]

{ #category : #testing }
XPathASTNode >> isFilterExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isFilterExpressionLocationPath [
	^ false
]

{ #category : #testing }
XPathASTNode >> isFilterable [
	^ false
]

{ #category : #testing }
XPathASTNode >> isFollowingSiblingStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isFollowingStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isFunctionCall [
	^ false
]

{ #category : #testing }
XPathASTNode >> isGreaterThanExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isGreaterThanOrEqualToExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isLessThanExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isLessThanOrEqualToExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isLiteral [
	^ false
]

{ #category : #testing }
XPathASTNode >> isLocationPath [
	^ false
]

{ #category : #testing }
XPathASTNode >> isModulusExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isMultiplicationExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isMultiplicativeExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceNodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceNodeTestForLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceNodeTestForName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceNodeTestForNamespaceURI [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceNodeTestForNamespaceURIAndLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceNodeTestForPrefix [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceNodeTestForPrefixAndLocalName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNamespaceStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNegationExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNodeWithExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNodeWithOtherExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNotEqualsExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNull [
	^ false
]

{ #category : #testing }
XPathASTNode >> isNumberLiteral [
	^ false
]

{ #category : #testing }
XPathASTNode >> isOperatorExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isOrExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isPINodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isPINodeTestForName [
	^ false
]

{ #category : #testing }
XPathASTNode >> isParentStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isPrecedingSiblingStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isPrecedingStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isPredicate [
	^ false
]

{ #category : #testing }
XPathASTNode >> isRelationalExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isRelativeLocationPath [
	^ false
]

{ #category : #testing }
XPathASTNode >> isSelfStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isStep [
	^ false
]

{ #category : #testing }
XPathASTNode >> isStringLiteral [
	^ false
]

{ #category : #testing }
XPathASTNode >> isSubtractionExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isTextNodeTest [
	^ false
]

{ #category : #testing }
XPathASTNode >> isUnaryOperatorExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isUnionExpression [
	^ false
]

{ #category : #testing }
XPathASTNode >> isVariableReference [
	^ false
]

{ #category : #accessing }
XPathASTNode >> parent [
	^ parent ifNil: [parent := XPathASTNullNode new]
]

{ #category : #accessing }
XPathASTNode >> parent: aParent [
	parent := aParent
]

{ #category : #printing }
XPathASTNode >> printOn: aStream [
	"Prints the full AST on aStream as unabbreviated XPath source code that can
	be parsed by an XPathExpressionParser.

	To get the source code as a string without possible truncation of the
	output, use #asString instead of #printString."

	(XPathASTSourceWritingNodeVisitor on: aStream)
		visitNode: self
]

{ #category : #accessing }
XPathASTNode >> type [
	^ type ifNil: [type := self defaultTypeClass new]
]

{ #category : #accessing }
XPathASTNode >> type: aType [
	type := aType
]
