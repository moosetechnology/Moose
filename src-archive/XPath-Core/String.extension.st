Extension { #name : #String }

{ #category : #'*XPath-Core-converting' }
String >> ?? aPredicateOrPredicateCollection [
	^ XPathNodeTestWithPredicates
		nodeTest: self
		predicates: aPredicateOrPredicateCollection
]

{ #category : #'*XPath-Core-converting' }
String >> asXPath [
	^ XPath for: self
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathAttributeAxisNodeTest [
	"parse the receiver as a node test where attributes are the principal node type"
	^ (XPathNodeTestParser
		on: self
		for: XPathStringNodeTestParserHandler withAttributePrincipalNodeType) parse
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathBoolean [
	^ self notEmpty
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathComparable [
	^ XPathStringComparable value: self
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathFilterExpressionLocationPathRoot [
	XPathTypeException signal: 'Cannot use strings as location path roots'
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathFilterExpressionPredicateRoot [
	XPathTypeException signal: 'Cannot filter strings'
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathNamespaceAxisNodeTest [
	"parse the receiver as a node test where namespaces are the principal node type"
	^ (XPathNodeTestParser
		on: self
		for: XPathStringNodeTestParserHandler withNamespacePrincipalNodeType) parse
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathNodeSet [
	XPathTypeException signal: 'Cannot convert strings to node sets'
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathNodeTest [
	"parse the receiver as a node test where elements are the principal node type"
	^ (XPathNodeTestParser
		on: self
		for: XPathStringNodeTestParserHandler withElementPrincipalNodeType) parse
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathNumber [
	^ [(XPathNumberParser
			on: self
			for: XPathFloatNumberParserHandler new) parse]
		on: XPathSyntaxException
		do: [:error | Float nan]
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathString [
	^ self
]

{ #category : #'*XPath-Core-converting' }
String >> asXPathUnionable [
	XPathTypeException signal: 'Cannot union strings'
]
