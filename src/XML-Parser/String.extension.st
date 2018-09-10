Extension { #name : #String }

{ #category : #'*XML-Parser' }
String >> asXMLEscapedString [
	"returns a copy of self with &, <, and > escaped with &amp;, &lt;, and &gt;"
	| stream |

	stream := (self class new: self size) writeStream.
	"to:do: for performance"
	1 to: self size do: [:i | | nextChar |
		(nextChar := self at: i) == $<
			ifTrue: [stream nextPutAll: '&lt;']
			ifFalse: [
				nextChar == $> "needed to escape ]]> in PCDATA"
					ifTrue: [stream nextPutAll: '&gt;']
					ifFalse: [
						nextChar == $&
							ifTrue: [stream nextPutAll: '&amp;']
							ifFalse: [stream nextPut: nextChar]]]].
	^ stream contents.
]

{ #category : #'*XML-Parser' }
String >> asXMLFileHandle [
	^ XMLFileHandle path: self
]

{ #category : #'*XML-Parser' }
String >> asXMLHTTPRequest [
	^ XMLHTTPRequest url: self
]

{ #category : #'*XML-Parser' }
String >> asXMLStreamConverter [
	^ XMLStreamConverter newForEncoding: self
]

{ #category : #'*XML-Parser' }
String >> asXMLString [
	"will be deprecated; use #asXMLStringNode instead"

	^ self asXMLStringNode
]

{ #category : #'*XML-Parser' }
String >> asXMLStringNode [
	^ XMLString string: self
]

{ #category : #'*XML-Parser' }
String >> asXMLURI [
	^ XMLURI fromString: self
]

{ #category : #'*XML-Parser' }
String >> expandWithXMLNamespaceURI: aURI [
	"optimized"
	aURI size == 0
		ifTrue: [^ self]
		ifFalse: [^ 'Q{', aURI, '}', self]
]

{ #category : #'*XML-Parser' }
String >> isXMLNCName [
	"optimized"
	self size == 0
		ifTrue: [^ false].
	(self at: 1) isXMLNCNameStartChar
		ifFalse: [^ false].
	2 to: self size do: [:i |
		(self at: i) isXMLNCNameChar
			ifFalse: [^ false]].
	^ true.
]

{ #category : #'*XML-Parser' }
String >> isXMLNSAttributeName [
	"optimized"
	self size >= 5
		ifFalse: [^ false].
	(self at: 1) == $x
		ifFalse: [^ false].
	(self at: 2) == $m
		ifFalse: [^ false].
	(self at: 3) == $l
		ifFalse: [^ false].
	(self at: 4) == $n
		ifFalse: [^ false].
	(self at: 5) == $s
		ifFalse: [^ false].
	self size == 5
		ifTrue: [^ true].
	^ (self at: 6) == $:.
]

{ #category : #'*XML-Parser' }
String >> isXMLName [
	"optimized"
	self size == 0
		ifTrue: [^ false].
	(self at: 1) isXMLNameStartChar
		ifFalse: [^ false].
	2 to: self size do: [:i |
		(self at: i) isXMLNameChar
			ifFalse: [^ false]].
	^ true.
]

{ #category : #'*XML-Parser' }
String >> isXMLNmtoken [
	"optimized"
	self size == 0
		ifTrue: [^ false].
	1 to: self size do: [:i |
		(self at: i) isXMLNameChar
			ifFalse: [^ false]].
	^ true.
]

{ #category : #'*XML-Parser' }
String >> isXMLQualifiedOrLocalName: aQualifiedOrLocalName [
	"returns true if self and aQualifiedOrLocalName are the
	same QName or if self is a QName and aQualifiedOrLocalName
	is the local part, or if they are the same NCName."
	| i |

	i := aQualifiedOrLocalName size.
	self size to: 1 by: -1 do: [:j |
		i == 0
			ifTrue: [^ (self at: j) == $:].
		"avoid #== for compatibility with pre-Spur VMs where wide chars
		aren't an immediate type"
		(aQualifiedOrLocalName at: i) = (self at: j)
			ifFalse: [^ false].
		i := i - 1].
	^ i == 0.
]

{ #category : #'*XML-Parser' }
String >> isXMLReservedAttributeName [
	"optimized"
	self size > 3
		ifFalse: [^ false].
	(self at: 1) == $x
		ifFalse: [^ false].
	(self at: 2) == $m
		ifFalse: [^ false].
	^ (self at: 3) == $l.
]

{ #category : #'*XML-Parser' }
String >> isXMLWhitespace [
	"optimized"
	self size == 0
		ifTrue: [^ false].
	1 to: self size do: [:i |
		(self at: i) isXMLWhitespace
			ifFalse: [^ false]].
	^ true.
]

{ #category : #'*XML-Parser' }
String >> parseXML [
	^ XMLDOMParser parse: self
]

{ #category : #'*XML-Parser' }
String >> qualifyWithXMLPrefix: aPrefix [
	"optimized"
	aPrefix size == 0
		ifTrue: [^ self]
		ifFalse: [^ (aPrefix copyWith: $:), self]
]

{ #category : #'*XML-Parser' }
String >> xmlCopyWithoutWhitespace [
	^ self reject: [:each | each isXMLWhitespace]
]

{ #category : #'*XML-Parser' }
String >> xmlLocalNameAfterPrefix [
	^ self xmlLocalNameAfterPrefix: self xmlPrefixBeforeLocalName
]

{ #category : #'*XML-Parser' }
String >> xmlLocalNameAfterPrefix: aPrefix [
	"optimized"
	| prefixSize |

	(prefixSize := aPrefix size) == 0
		ifTrue: [^ self]
		ifFalse: [^ self copyFrom: prefixSize + 2 to: self size]
]

{ #category : #'*XML-Parser' }
String >> xmlPrefixBeforeLocalName [
	"optimized"
	| i |

	i := self size.
	[i == 0]
		whileFalse: [
			((self at: i) == $:)
				ifTrue: [^ (self copyFrom: 1 to: i - 1)].
			i := i - 1].
	^ ''.
]

{ #category : #'*XML-Parser' }
String >> xmlPrefixBeforeLocalName: aLocalName [
	"optimized"
	| prefixSize |

	(prefixSize := self size - aLocalName size - 1) > 0
		ifTrue: [^ self copyFrom: 1 to: prefixSize]
		ifFalse: [^ '']
]
