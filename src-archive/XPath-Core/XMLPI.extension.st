Extension { #name : #XMLPI }

{ #category : #'*XPath-Core-accessing' }
XMLPI >> expandedName [
	^ self localName expandWithXMLNamespaceURI: self namespaceURI
]

{ #category : #'*XPath-Core-testing' }
XMLPI >> hasExpandedName [
	^ true
]

{ #category : #'*XPath-Core-testing' }
XMLPI >> hasNamespaceURI [
	^ false
]

{ #category : #'*XPath-Core-testing' }
XMLPI >> hasPrefix [
	^ false
]

{ #category : #'*XPath-Core-accessing' }
XMLPI >> localName [
	^ self name
]

{ #category : #'*XPath-Core-accessing' }
XMLPI >> name [
	^ self target
]

{ #category : #'*XPath-Core-accessing' }
XMLPI >> namespaceURI [
	"The spec says the namespace URI part of a PI expanded name is null"
	^ ''
]

{ #category : #'*XPath-Core-accessing' }
XMLPI >> prefix [
	^ ''
]

{ #category : #'*XPath-Core-accessing' }
XMLPI >> stringValue [
	^ self data
]
