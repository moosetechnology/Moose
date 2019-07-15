Extension { #name : #BlockClosure }

{ #category : #'*XPath-Core-converting' }
BlockClosure >> ?? aPredicateOrPredicateCollection [
	^ XPathNodeTestWithPredicates
		nodeTest: self
		predicates: aPredicateOrPredicateCollection
]

{ #category : #'*XPath-Core-converting' }
BlockClosure >> asXPathAttributeAxisNodeTest [
	^ self
]

{ #category : #'*XPath-Core-converting' }
BlockClosure >> asXPathNamespaceAxisNodeTest [
	^ self
]

{ #category : #'*XPath-Core-converting' }
BlockClosure >> asXPathNodeTest [
	^ XPathBlockNodeTest block: self
]
