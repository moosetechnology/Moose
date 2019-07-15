"
This class models an element namespace prefix and URI mapping as a DOM node for compatibility with the XPath standard. Namespace nodes are equal only if they have the same name, namespace URI, and belong to the same element.
"
Class {
	#name : #XPathNamespaceNode,
	#superclass : #XMLNode,
	#instVars : [
		'name',
		'uri'
	],
	#category : #'XPath-Core-DOM'
}

{ #category : #'instance creation' }
XPathNamespaceNode class >> element: anElement name: aPrefix uri: aURI [
	^ self new
		setElement: anElement
		name: aPrefix
		uri: aURI
]

{ #category : #'instance creation' }
XPathNamespaceNode class >> withXMLNamespaceOnElement: anElement [
	^ self
		element: anElement
		name: 'xml'
		uri: XMLNamespaceScope xmlNamespaceURI
]

{ #category : #comparing }
XPathNamespaceNode >> = anObject [
	"This is needed because namespace nodes aren't part of DOM trees
	and are created dynamically by XPath, so unless = is defined the union
	of two node sets could contain duplicate nodes for the same element
	namespace"

	self == anObject
		ifTrue: [^ true].

	self class == anObject class
		ifFalse: [^ false].

	"different elements don't share namespace nodes with the same name/uri
	according to the spec"
	^ self element = anObject element
		and: [self name = anObject name
			and: [self uri = anObject uri]].
]

{ #category : #accessing }
XPathNamespaceNode >> element [
	^ parent
]

{ #category : #accessing }
XPathNamespaceNode >> expandedName [
	^ self localName expandWithXMLNamespaceURI: self namespaceURI
]

{ #category : #testing }
XPathNamespaceNode >> hasExpandedName [
	^ true
]

{ #category : #testing }
XPathNamespaceNode >> hasNamespaceURI [
	"spec says namespace nodes cannot be namespaced
	(the namespace part of the expanded name is null)"
	^ false
]

{ #category : #testing }
XPathNamespaceNode >> hasPrefix [
	"namespace names cannot be prefixed"
	^ false
]

{ #category : #comparing }
XPathNamespaceNode >> hash [
	^ (self species hash bitXor:
		self name hash) bitXor:
			self uri hash
]

{ #category : #testing }
XPathNamespaceNode >> isNamespace [
	^ true
]

{ #category : #accessing }
XPathNamespaceNode >> localName [
	^ self name
]

{ #category : #accessing }
XPathNamespaceNode >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XPathNamespaceNode >> namespaceURI [
	"spec says namespace nodes cannot be namespaced
	(the namespace part of the expanded name is null)"
	^ ''
]

{ #category : #accessing }
XPathNamespaceNode >> prefix [
	"namespace names cannot be prefixed"
	^ ''
]

{ #category : #initialization }
XPathNamespaceNode >> setElement: anElement name: aPrefix uri: aURI [
	"reuse parent inst var, like in XMLAttribute"
	parent := anElement.
	name := aPrefix.
	uri := aURI.
]

{ #category : #accessing }
XPathNamespaceNode >> stringValue [
	^ self uri
]

{ #category : #accessing }
XPathNamespaceNode >> uri [
	^ uri ifNil: [uri := '']
]

{ #category : #printing }
XPathNamespaceNode >> writeXMLOn: aWriter [
	aWriter
		writeXMLNS: self name;
		nextPut: $=;
		writeEscapedContentString: self uri
]
