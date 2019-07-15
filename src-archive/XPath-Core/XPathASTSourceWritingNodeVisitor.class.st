"
This class is a writing AST visitor that writes the AST as XPath source code that can be parsed by an XPathExpressionParser.
"
Class {
	#name : #XPathASTSourceWritingNodeVisitor,
	#superclass : #XPathASTWritingNodeVisitor,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #private }
XPathASTSourceWritingNodeVisitor >> emitArgumentSeparator [
	self previousArgument isNull
		ifFalse: [self emitAll: ', ']
]

{ #category : #private }
XPathASTSourceWritingNodeVisitor >> emitAxisName: anAxisNameStringOrCharacter [
	self
		emitAll: anAxisNameStringOrCharacter asString;
		emitAll: '::'
]

{ #category : #private }
XPathASTSourceWritingNodeVisitor >> emitNodeTest: aNodeTest withNameTest: aNameTestString [
	(aNodeTest hasParent
		and: [aNodeTest nodeType = aNodeTest parent principalNodeType])
		ifTrue: [
			"if the node type of the node test is the principal node
			type of the axis, then it's redundant and can be omitted"
			self emitAll: aNameTestString]
		ifFalse: [
			self
				emitTypeTest: aNodeTest
				withNameTest: aNameTestString].
	^ aNodeTest
]

{ #category : #private }
XPathASTSourceWritingNodeVisitor >> emitOperatorName: anOperatorNameStringOrCharacter [
	self emitAll: anOperatorNameStringOrCharacter asString
]

{ #category : #private }
XPathASTSourceWritingNodeVisitor >> emitTypeTest: aNodeTest withNameTest: aNameTestString [
	self
		emitAll: aNodeTest nodeType name;
		emit: $(;
		emitAll: aNameTestString;
		emit: $).
	^ aNodeTest
]

{ #category : #'visiting - functions' }
XPathASTSourceWritingNodeVisitor >> visitArgument: anArgument [
	self emitArgumentSeparator.
	^ super visitArgument: anArgument.
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitAttributeNodeTest: anAttributeNodeTest [
	^ self
		emitNodeTest: anAttributeNodeTest
		withNameTest: '*'
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitAttributeNodeTestForLocalName: anAttributeNodeTestForLocalName [
	^ self
		emitNodeTest: anAttributeNodeTestForLocalName
		withNameTest: anAttributeNodeTestForLocalName localName
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitAttributeNodeTestForName: anAttributeNodeTestForName [
	^ self
		emitNodeTest: anAttributeNodeTestForName
		withNameTest: anAttributeNodeTestForName name
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitAttributeNodeTestForNamespaceURI: anAttributeNodeTestForNamespaceURI [
	^ self
		emitNodeTest: anAttributeNodeTestForNamespaceURI
		withNameTest:
			('*' expandWithXMLNamespaceURI:
				anAttributeNodeTestForNamespaceURI namespaceURI)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitAttributeNodeTestForNamespaceURIAndLocalName: anAttributeNodeTestForNamespaceURIAndLocalName [
	^ self
		emitNodeTest: anAttributeNodeTestForNamespaceURIAndLocalName
		withNameTest:
			(anAttributeNodeTestForNamespaceURIAndLocalName localName 
				expandWithXMLNamespaceURI:
					anAttributeNodeTestForNamespaceURIAndLocalName namespaceURI)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitAttributeNodeTestForPrefix: anAttributeNodeTestForPrefix [
	^ self
		emitNodeTest: anAttributeNodeTestForPrefix
		withNameTest: ('*' qualifyWithXMLPrefix: anAttributeNodeTestForPrefix prefix)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitAttributeNodeTestForPrefixAndLocalName: anAttributeNodeTestForPrefixAndLocalName [
	^ self
		emitNodeTest: anAttributeNodeTestForPrefixAndLocalName
		withNameTest:
			(anAttributeNodeTestForPrefixAndLocalName localName
				qualifyWithXMLPrefix:
					anAttributeNodeTestForPrefixAndLocalName prefix)
]

{ #category : #'visiting - operators' }
XPathASTSourceWritingNodeVisitor >> visitBinaryOperatorExpression: aBinaryOperatorExpression [
	self emit: $(.
	aBinaryOperatorExpression expression acceptNodeVisitor: self.
	self
		emitSpace;
		emitOperatorName: aBinaryOperatorExpression operatorName;
		emitSpace.
	aBinaryOperatorExpression otherExpression acceptNodeVisitor: self.
	self emit: $).
	^ aBinaryOperatorExpression.
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitElementNodeTest: anElementNodeTest [
	^ self
		emitNodeTest: anElementNodeTest
		withNameTest: '*'
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitElementNodeTestForLocalName: anElementNodeTestForLocalName [
	^ self
		emitNodeTest: anElementNodeTestForLocalName
		withNameTest: anElementNodeTestForLocalName localName
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitElementNodeTestForName: anElementNodeTestForName [
	^ self
		emitNodeTest: anElementNodeTestForName
		withNameTest: anElementNodeTestForName name
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitElementNodeTestForNamespaceURI: anElementNodeTestForNamespaceURI [
	^ self
		emitNodeTest: anElementNodeTestForNamespaceURI
		withNameTest:
			('*' expandWithXMLNamespaceURI:
				anElementNodeTestForNamespaceURI namespaceURI)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitElementNodeTestForNamespaceURIAndLocalName: anElementNodeTestForNamespaceURIAndLocalName [
	^ self
		emitNodeTest: anElementNodeTestForNamespaceURIAndLocalName
		withNameTest:
			(anElementNodeTestForNamespaceURIAndLocalName localName 
				expandWithXMLNamespaceURI:
					anElementNodeTestForNamespaceURIAndLocalName namespaceURI)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitElementNodeTestForPrefix: anElementNodeTestForPrefix [
	^ self
		emitNodeTest: anElementNodeTestForPrefix
		withNameTest: ('*' qualifyWithXMLPrefix: anElementNodeTestForPrefix prefix)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitElementNodeTestForPrefixAndLocalName: anElementNodeTestForPrefixAndLocalName [
	^ self
		emitNodeTest: anElementNodeTestForPrefixAndLocalName
		withNameTest:
			(anElementNodeTestForPrefixAndLocalName localName
				qualifyWithXMLPrefix:
					anElementNodeTestForPrefixAndLocalName prefix)
]

{ #category : #'visiting - location paths' }
XPathASTSourceWritingNodeVisitor >> visitFilterExpression: aFilterExpression [
	self emit: $(.
	aFilterExpression expression acceptNodeVisitor: self.
	^ self
		emit: $);
		visitFilterable: aFilterExpression.
]

{ #category : #'visiting - location paths' }
XPathASTSourceWritingNodeVisitor >> visitFilterExpressionLocationPath: aFilterExpressionLocationPath [
	self emit: $(.
	aFilterExpressionLocationPath expression acceptNodeVisitor: self.
	^ self
		emit: $);
		visitLocationPath: aFilterExpressionLocationPath.
]

{ #category : #'visiting - functions' }
XPathASTSourceWritingNodeVisitor >> visitFunctionCall: aFunctionCall [
	self
		emitAll: aFunctionCall name;
		emit: $(.
	super visitFunctionCall: aFunctionCall.
	self emit: $).
	^ aFunctionCall.
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNamespaceNodeTest: aNamespaceNodeTest [
	^ self
		emitNodeTest: aNamespaceNodeTest
		withNameTest: '*'
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNamespaceNodeTestForLocalName: aNamespaceNodeTestForLocalName [
	^ self
		emitNodeTest: aNamespaceNodeTestForLocalName
		withNameTest: aNamespaceNodeTestForLocalName localName
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNamespaceNodeTestForName: aNamespaceNodeTestForName [
	^ self
		emitNodeTest: aNamespaceNodeTestForName
		withNameTest: aNamespaceNodeTestForName name
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNamespaceNodeTestForNamespaceURI: aNamespaceNodeTestForNamespaceURI [
	^ self
		emitNodeTest: aNamespaceNodeTestForNamespaceURI
		withNameTest:
			('*' expandWithXMLNamespaceURI:
				aNamespaceNodeTestForNamespaceURI namespaceURI)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNamespaceNodeTestForNamespaceURIAndLocalName: aNamespaceNodeTestForNamespaceURIAndLocalName [
	^ self
		emitNodeTest: aNamespaceNodeTestForNamespaceURIAndLocalName
		withNameTest:
			(aNamespaceNodeTestForNamespaceURIAndLocalName localName 
				expandWithXMLNamespaceURI:
					aNamespaceNodeTestForNamespaceURIAndLocalName namespaceURI)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNamespaceNodeTestForPrefix: aNamespaceNodeTestForPrefix [
	^ self
		emitNodeTest: aNamespaceNodeTestForPrefix
		withNameTest: ('*' qualifyWithXMLPrefix: aNamespaceNodeTestForPrefix prefix)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNamespaceNodeTestForPrefixAndLocalName: aNamespaceNodeTestForPrefixAndLocalName [
	^ self
		emitNodeTest: aNamespaceNodeTestForPrefixAndLocalName
		withNameTest:
			(aNamespaceNodeTestForPrefixAndLocalName localName
				qualifyWithXMLPrefix:
					aNamespaceNodeTestForPrefixAndLocalName prefix)
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitNodeTest: aNodeTest [
	self
		emitNodeTest: aNodeTest
		withNameTest: ''.
	^ super visitNodeTest: aNodeTest.
]

{ #category : #'visiting - literals' }
XPathASTSourceWritingNodeVisitor >> visitNumberLiteral: aNumberLiteral [
	| number |

	(number := aNumberLiteral number) isNaN
		ifTrue: [self emitAll: '(0 div 0)']
		ifFalse: [
			number isInfinite
				ifTrue: [
					number negative
						ifTrue: [self emitAll: '(-1 div 0)']
						ifFalse: [self emitAll: '(1 div 0)']]
				ifFalse: [
					number isZero
						ifTrue: [
							number isXPathNegativeZero
								ifTrue: [self emitAll: '-0.0']
								ifFalse: [self emitAll: '0.0']]
						ifFalse: [
							"otherwise, this is enough to get an acceptable
							integer or limited decimal (if the #fractionPart is
							non-zero) representation that an XPathExpressionParser
							or XPathNumberParser will understand"
							self emitAll: number asXPathString]]].

	^ aNumberLiteral.
]

{ #category : #'visiting - node tests' }
XPathASTSourceWritingNodeVisitor >> visitPINodeTestForName: aPINodeTestForName [
	^ self
		emitNodeTest: aPINodeTestForName
		withNameTest: aPINodeTestForName name
]

{ #category : #'visiting - predicates' }
XPathASTSourceWritingNodeVisitor >> visitPredicate: aPredicate [
	self emit: $[.
	super visitPredicate: aPredicate.
	self emit: $].
	^ aPredicate.
]

{ #category : #'visiting - steps' }
XPathASTSourceWritingNodeVisitor >> visitStep: aStep [
	(self previousStep isNull
		and: [aStep parent isRelativeLocationPath])
		ifFalse: [self emit: $/].
	self emitAxisName: aStep axisName.
	super visitStep: aStep.
	^ aStep.
]

{ #category : #'visiting - literals' }
XPathASTSourceWritingNodeVisitor >> visitStringLiteral: aStringLiteral [
	| quote |

	"use whichever quote char the string doesn't contain, but
	default to the double quote"
	quote :=
		(aStringLiteral string includes: $")
			ifTrue: [$']
			ifFalse: [$"].
	self
		emit: quote;
		emitAll: aStringLiteral string;
		emit: quote.
	^ aStringLiteral.
]

{ #category : #'visiting - operators' }
XPathASTSourceWritingNodeVisitor >> visitUnaryOperatorExpression: aUnaryOperatorExpression [
	self
		emitOperatorName: aUnaryOperatorExpression operatorName;
		emit: $(.
	super visitUnaryOperatorExpression: aUnaryOperatorExpression.
	self emit: $).
	^ aUnaryOperatorExpression.
]

{ #category : #'visiting - variables' }
XPathASTSourceWritingNodeVisitor >> visitVariableReference: aVariableReference [
	self
		emit: $$;
		emitAll: aVariableReference name
]
