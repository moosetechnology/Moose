"
This class can match elements to classes based on their names, namespace URIs, and attributes.

The precedence of mapping goes:
-Qualified name, namespace URI, and attributes
-Qualified name and namespace URI
-Qualified name and attributes
-Qualified name
-Non-qualified name, namespace URI, and attributes
-Non-qualified name and namespace URI
-Non-qualified name and attributes
-Non-qualified name
"
Class {
	#name : #XMLBasicElementClassMapper,
	#superclass : #XMLElementClassMapper,
	#instVars : [
		'elementClassMap'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #accessing }
XMLBasicElementClassMapper >> classForElement: aQualifiedName attributes: anAssociationCollection ifNone: aBlock [
	^ self
		classForElement: aQualifiedName
		namespaceURI: ''
		attributes: anAssociationCollection
		ifNone: aBlock
]

{ #category : #accessing }
XMLBasicElementClassMapper >> classForElement: aQualifiedName ifNone: aBlock [
	^ self
		classForElement: aQualifiedName
		namespaceURI: ''
		attributes: XMLLazyAttributeDictionary  new
		ifNone: aBlock
]

{ #category : #accessing }
XMLBasicElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI attributes: anAssociationCollection ifNone: aBlock [
	| localName attributeDictionary |

	attributeDictionary := anAssociationCollection asXMLAttributeDictionary.
	aURI size > 0 "optimization"
		ifTrue: [
			(self
				elementClassMapAt: aQualifiedName -> aURI
				attributes: attributeDictionary)
				ifNotNil: [:class | ^ class].
			(self
				elementClassMapAt: aQualifiedName
				attributes: attributeDictionary)
				ifNotNil: [:class | ^ class].
			(localName := aQualifiedName xmlLocalNameAfterPrefix) size <
				aQualifiedName size
				ifTrue: [
					(self
						elementClassMapAt: localName -> aURI
						attributes: attributeDictionary)
						ifNotNil: [:class | ^ class].
					(self
						elementClassMapAt: localName
						attributes: attributeDictionary)
						ifNotNil: [:class | ^ class]]]
		ifFalse: [
			(self
				elementClassMapAt: aQualifiedName
				attributes: attributeDictionary)
				ifNotNil: [:class | ^ class].
			(localName := aQualifiedName xmlLocalNameAfterPrefix) size <
				aQualifiedName size
				ifTrue: [
					(self
						elementClassMapAt: localName
						attributes: attributeDictionary)
						ifNotNil: [:class | ^ class]]].

	^ aBlock value.
]

{ #category : #accessing }
XMLBasicElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI ifNone: aBlock [
	^ self
		classForElement: aQualifiedName
		namespaceURI: aURI
		attributes: XMLLazyAttributeDictionary new
		ifNone: aBlock
]

{ #category : #accessing }
XMLBasicElementClassMapper >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection ifNone: aBlock [
	| attributeDictionary |

	attributeDictionary := anAssociationCollection.
	aURI size > 0 "optimization"
		ifTrue: [
			(self
				elementClassMapAt: aQualifiedName -> aURI
				attributes: attributeDictionary)
				ifNotNil: [:class | ^ class].
			(self
				elementClassMapAt: aQualifiedName
				attributes: attributeDictionary)
				ifNotNil: [:class | ^ class].
			aLocalName size < aQualifiedName size
				ifTrue: [
					(self
						elementClassMapAt: aLocalName -> aURI
						attributes: attributeDictionary)
						ifNotNil: [:class | ^ class].
					(self
						elementClassMapAt: aLocalName
						attributes: attributeDictionary)
						ifNotNil: [:class | ^ class]]]
		ifFalse: [
			(self
				elementClassMapAt: aQualifiedName
				attributes: attributeDictionary)
				ifNotNil: [:class | ^ class].
			aLocalName size < aQualifiedName size
				ifTrue: [
					(self
						elementClassMapAt: aLocalName
						attributes: attributeDictionary)
						ifNotNil: [:class | ^ class]]].

	^ aBlock value.
]

{ #category : #private }
XMLBasicElementClassMapper >> elementClassMap [
	^ elementClassMap
]

{ #category : #private }
XMLBasicElementClassMapper >> elementClassMapAt: aKey attributes: anAttributeDictionary [
	| classOrCollection |

	classOrCollection :=
		elementClassMap
			at: aKey
			ifAbsent: [^ nil].

	classOrCollection isCollection
		ifTrue: [
			"to:do: for speed"
			1 to: classOrCollection size - 1 do: [:i |
				((classOrCollection at: i) key
					matchesAttributes: anAttributeDictionary)
					ifTrue: [^ (classOrCollection at: i) value]].
			^ classOrCollection last]
		ifFalse: [^ classOrCollection].
]

{ #category : #initialization }
XMLBasicElementClassMapper >> initialize [
	super initialize.

	elementClassMap := Dictionary new.
]

{ #category : #mapping }
XMLBasicElementClassMapper >> mapElement: anElement attributeSpec: anAttributeSpec toClass: aClass [
	| classOrCollection |

	classOrCollection :=
		elementClassMap
			at: anElement
			ifAbsent: [nil].

	classOrCollection isCollection
		ifTrue: [
			"new mappings have precedence over old"
			classOrCollection addFirst: anAttributeSpec -> aClass]
		ifFalse: [
			elementClassMap
				at: anElement
				put:
					(OrderedCollection
						with: anAttributeSpec -> aClass
						with: classOrCollection)].
]

{ #category : #mapping }
XMLBasicElementClassMapper >> mapElement: anElement namespaceURI: aURI attributeSpec: anAttributeSpec toClass: aClass [
	self
		mapElement:
			(aURI size > 0
				ifTrue: [anElement -> aURI]
				ifFalse: [anElement])
		attributeSpec: anAttributeSpec
		toClass: aClass
]

{ #category : #mapping }
XMLBasicElementClassMapper >> mapElement: anElement namespaceURI: aURI toClass: aClass [
	self
		mapElement:
			(aURI size > 0
				ifTrue: [anElement -> aURI]
				ifFalse: [anElement])
		toClass: aClass
]

{ #category : #mapping }
XMLBasicElementClassMapper >> mapElement: anElement toClass: aClass [
	| classOrCollection |

	classOrCollection :=
		elementClassMap
			at: anElement
			ifAbsent: [nil].

	classOrCollection isCollection
		ifTrue: [
			classOrCollection
				at: classOrCollection size
				put: aClass]
		ifFalse: [
			elementClassMap
				at: anElement
				put: aClass].
]

{ #category : #copying }
XMLBasicElementClassMapper >> postCopy [
	super postCopy.

	elementClassMap := elementClassMap copy.

	"each val is either a class or an OrderedCollection, which needs
	to be copied so new mappings in either the copy or original don't
	effect the other"
	elementClassMap associationsDo: [:each |
		each value isCollection
			ifTrue: [each value: each value copy]].
]
