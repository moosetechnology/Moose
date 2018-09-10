"
The class represents an attribute node stored in an attribute node list. The name of an attribute node can be namespaced using prefixes, but the prefix must be mapped to a namespace URI in the containing element node. Unprefixed attributes have no namespace, not even a default if one is in scope, per the XML namespace standard.

The element of an attribute can be accessed with #element, but also with #parent, because attributes are modeled so their element is their parent (to simplify the implementation of the XPath library).
"
Class {
	#name : #XMLAttribute,
	#superclass : #XMLNode,
	#instVars : [
		'name',
		'value'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLAttribute class >> name: aName [
	^ self named: aName
]

{ #category : #'instance creation' }
XMLAttribute class >> name: aName value: aValue [
	^ self new	
		setName: aName
		value: aValue
		element: nil
]

{ #category : #'instance creation' }
XMLAttribute class >> named: aName [
	^ self
		name: aName
		value: ''
]

{ #category : #accessing }
XMLAttribute >> element [
	"reuse an inst var to save memory"
	^ parent
]

{ #category : #accessing }
XMLAttribute >> element: anElement [
	"reuse an inst var to save memory"
	parent := anElement
]

{ #category : #accessing }
XMLAttribute >> expandedName [
	"Returns the expanded name of the attribute as a string in the form of
	'{namespaceURI}localName' if there's a namespace URI or 'localName' if there
	isn't"

	^ self localName expandWithXMLNamespaceURI: self namespaceURI
]

{ #category : #testing }
XMLAttribute >> hasNamespaceURI [
	^ self namespaceURI notEmpty
]

{ #category : #testing }
XMLAttribute >> hasPrefix [
	^ (self name
		indexOf: $:
		startingAt: 2) > 0
]

{ #category : #testing }
XMLAttribute >> isAttribute [
	^ true
]

{ #category : #testing }
XMLAttribute >> isInLanguage: aLanguageTag [
	"Returns true if the receiver is an xml:lang attribute or if its element
	or an ancestor element has an xml:lang attribute, and if the value is an IETF
	language tag, like 'en-US', that matches aLanguageTag. Matching is
	case-insensitive, and aLanguageTag can be partial, like 'en', and use
	wildcards, like 'en-*'"

	self name = 'xml:lang'
		ifTrue: [^ self matchesLanguage: aLanguageTag]
		ifFalse: [^ super isInLanguage: aLanguageTag]
]

{ #category : #testing }
XMLAttribute >> isNamed: aName [
	"Does the receiver's qualified or local name match the argument?"

	^ self name isXMLQualifiedOrLocalName: aName
]

{ #category : #testing }
XMLAttribute >> isNamedAny: aNameCollection [
	"Does the receiver's qualified or local name match any of the names
	in aNameCollection?"

	^ aNameCollection includesXMLName: self name
]

{ #category : #accessing }
XMLAttribute >> localName [
	"Returns the local name of the receiver, the name minus any leading
	prefix and colon like 'local' in 'prefix:local'"

	"this is recomputed from the name to save memory instead of
	being stored in an inst var like it is for XMLElement"
	^ self name xmlLocalNameAfterPrefix
]

{ #category : #testing }
XMLAttribute >> matchesLanguage: aLanguageTag [
	"Returns true if the value is an IETF language tag that matches aLanguageTag.
	Matching is case-insensitive, and aLanguageTag can be partial, like 'en',
	and use wildcards, like 'en-*'"

	| sourceLanguageTag targetLanguageTag i |

	((sourceLanguageTag := self value asLowercase) isEmpty
		or: [(targetLanguageTag := aLanguageTag asLowercase) isEmpty])
		ifTrue: [^ false].

	sourceLanguageTag = targetLanguageTag
		ifTrue: [^ true].

	sourceLanguageTag := $- xmlSplit: sourceLanguageTag.
	i := 0.
	$-
		xmlSplit: targetLanguageTag
		do: [:each | | sourceLanguageSubTag |
			sourceLanguageSubTag :=
				sourceLanguageTag
					at: (i := i + 1)
					ifAbsent: [^ false].
			(sourceLanguageSubTag = each
				or: [each = '*'])
				ifFalse: [^ false]].

	^ true.
]

{ #category : #accessing }
XMLAttribute >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XMLAttribute >> name: aName [
	self renameWith: [name := aName]
]

{ #category : #accessing }
XMLAttribute >> namespaceURI [
	^ self resolvePrefix: self prefix
]

{ #category : #accessing }
XMLAttribute >> prefix [
	"Returns the prefix of the receiver's name or an empty string if there
	isn't one."

	"this is recomputed from the qualified name instead of being stored
	in an inst var to save memory."
	^ self name xmlPrefixBeforeLocalName
]

{ #category : #accessing }
XMLAttribute >> prefix: aPrefix [
	self renameWith: [name := self localName qualifyWithXMLPrefix:  aPrefix]
]

{ #category : #private }
XMLAttribute >> renameWith: aBlock [
	| oldName |

	oldName := self name.
	aBlock value.
	(self name ~= oldName
		and: [self hasParent])
			ifTrue: [
				self parent
					renamedAttribute: self
					from: oldName
					to: self name].
]

{ #category : #namespacing }
XMLAttribute >> resolvePrefix: aPrefix [
	"This resolves the attribute prefix aPrefix or returns an empty string
	if aPrefix is empty (attributes must be prefixed to have a namespace) or
	undeclared"

	^ self
		resolvePrefix: aPrefix
		ifUnresolvable: ''
]

{ #category : #namespacing }
XMLAttribute >> resolvePrefix: aPrefix ifUnresolvable: aBlock [
	"This resolves the attribute prefix aPrefix or returns the result of
	evaluated aBlock if aPrefix is empty (attributes must be prefixed to have
	a namespace) or undeclared"

	^ (self hasParent
		and: [aPrefix size > 0]) "no default namespace for attributes"
		ifTrue: [
			self parent
				resolvePrefix: aPrefix
				ifUnresolvable: aBlock]
		ifFalse: [aBlock value]
]

{ #category : #initialization }
XMLAttribute >> setName: aName value: aValue element: anElement [
	name := aName.
	value := aValue.
	parent := anElement.
]

{ #category : #accessing }
XMLAttribute >> sortKey [
	^ self name
]

{ #category : #accessing }
XMLAttribute >> value [
	^ value ifNil: [value := '']
]

{ #category : #accessing }
XMLAttribute >> value: aString [
	value := aString
]

{ #category : #printing }
XMLAttribute >> writeXMLOn: aWriter [
	aWriter
		writeStringName: self name;
		nextPut: $=;
		writeEscapedContentString: self value
]
