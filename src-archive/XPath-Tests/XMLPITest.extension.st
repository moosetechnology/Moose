Extension { #name : #XMLPITest }

{ #category : #'*XPath-Tests' }
XMLPITest >> testExpandedName [
	self assert: self newPIWithTargetAndData expandedName = 'target'
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testHasExpandedName [
	self assert: self newNode hasExpandedName
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testHasNamespaceURI [
	self deny: self newPIWithTargetAndData hasNamespaceURI
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testHasPrefix [
	self deny: self newPIWithTargetAndData hasPrefix
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testLocalName [
	self assert: self newPIWithTargetAndData localName = 'target'
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testName [
	self assert: self newPIWithTargetAndData name = 'target'
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testNamespaceURI [
	self assert: self newPIWithTargetAndData namespaceURI = ''
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testPrefix [
	self assert: self newPIWithTargetAndData prefix = ''
]

{ #category : #'*XPath-Tests' }
XMLPITest >> testStringValue [
	super testStringValue.

	self assert: self newPIWithTargetAndData stringValue = 'data'.
]
