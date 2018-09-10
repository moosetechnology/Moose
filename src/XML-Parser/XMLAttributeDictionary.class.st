"
This class is an OrderPreservingStringDictionary for XML attributes that returns empty strings instead of raising errors when absent keys are looked up. It has messages to lookup the namespace URI of an attribute key and to lookup an attribute value or association by local or qualified name and namespace URI.
"
Class {
	#name : #XMLAttributeDictionary,
	#superclass : #OrderPreservingStringDictionary,
	#category : #'XML-Parser'
}

{ #category : #converting }
XMLAttributeDictionary >> asXMLAttributeDictionary [
	^ self
]

{ #category : #accessing }
XMLAttributeDictionary >> associationAtName: aQualifiedOrLocalName [
	^ self
		associationAtName: aQualifiedOrLocalName
		ifAbsent: [nil]
]

{ #category : #accessing }
XMLAttributeDictionary >> associationAtName: aQualifiedOrLocalName ifAbsent: aBlock [
	^ self
		associationAt: aQualifiedOrLocalName
		ifAbsent: [
			aQualifiedOrLocalName xmlPrefixBeforeLocalName isEmpty
				ifTrue: [
					self keysDo: [:each |
						(each isXMLQualifiedOrLocalName: aQualifiedOrLocalName)
							ifTrue: [^ self associationAt: each]]].
			aBlock value]
]

{ #category : #accessing }
XMLAttributeDictionary >> associationAtName: aQualifiedOrLocalName namespaceURI: aURI [
	^ self
		associationAtName: aQualifiedOrLocalName
		namespaceURI: aURI
		ifAbsent: [nil]
]

{ #category : #accessing }
XMLAttributeDictionary >> associationAtName: aQualifiedOrLocalName namespaceURI: aURI ifAbsent: aBlock [
	| namePrefix |

	(namePrefix := aQualifiedOrLocalName xmlPrefixBeforeLocalName) isEmpty
		ifTrue: [
			"aQualifiedOrLocalName has no prefix, so check for an
			attribute with a matching local name and namespace URI"
			self keysDo: [:each |
				(each isXMLQualifiedOrLocalName: aQualifiedOrLocalName)
					ifTrue: [| keyPrefix |
						(keyPrefix := each xmlPrefixBeforeLocalName) isEmpty
							ifTrue: [
								"unprefixed attribute have no namespace URI"
								aURI isEmpty
									ifTrue: [^ self associationAt: each]]
							ifFalse: [
								(self resolvePrefix: keyPrefix) = aURI
									ifTrue: [^ self associationAt: each]]]]]
		ifFalse: [
			"aQualifiedOrLocalName is a qualified name, look it up exactly"
			(self resolvePrefix: namePrefix) = aURI
				ifTrue: [
					^ self
						associationAt: aQualifiedOrLocalName
						ifAbsent: aBlock]].

	^ aBlock value.
]

{ #category : #private }
XMLAttributeDictionary >> at: aKey newPut: aValue [
	"should be identical to StandardOrderedDictionary>>#at:put: except
	it returns a boolean to tell if the key is new"
	| oldSize |

	oldSize := dictionary size.
	dictionary
		at: aKey
		put: aValue.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: aKey.
			^ true].
	^ false.
]

{ #category : #accessing }
XMLAttributeDictionary >> atName: aQualifiedOrLocalName [
	^ self
		atName: aQualifiedOrLocalName
		ifAbsent: ['']
]

{ #category : #accessing }
XMLAttributeDictionary >> atName: aQualifiedOrLocalName ifAbsent: aBlock [
	^ (self
		associationAtName: aQualifiedOrLocalName
		ifAbsent: [^ aBlock value])
		ifNil: [aBlock value]
		ifNotNil: [:association | association value]
]

{ #category : #accessing }
XMLAttributeDictionary >> atName: aQualifiedOrLocalName namespaceURI: aURI [
	^ self
		atName: aQualifiedOrLocalName
		namespaceURI: aURI
		ifAbsent: ['']
]

{ #category : #accessing }
XMLAttributeDictionary >> atName: aQualifiedOrLocalName namespaceURI: aURI ifAbsent: aBlock [
	^ (self
		associationAtName: aQualifiedOrLocalName
		namespaceURI: aURI)
		ifNil: [aBlock value]
		ifNotNil: [:association | association value]
]

{ #category : #private }
XMLAttributeDictionary >> namespaceScope [
	^ nil
]

{ #category : #accessing }
XMLAttributeDictionary >> namespaceURIOf: aKey [
	"Returns the namespace URI of the attribute name aKey"

	| prefix |

	^ (self usesNamespaces
		and: [(prefix := aKey xmlPrefixBeforeLocalName) notEmpty])
		ifTrue: [self resolvePrefix: prefix]
		ifFalse: ['']
]

{ #category : #private }
XMLAttributeDictionary >> resolvePrefix: aPrefix [
	^ self
		resolvePrefix: aPrefix
		ifUnresolvable: ''
]

{ #category : #private }
XMLAttributeDictionary >> resolvePrefix: aPrefix ifUnresolvable: aBlock [
	^ aBlock value
]

{ #category : #initialization }
XMLAttributeDictionary >> setNamespaceScope: aNamespaceScope [
]

{ #category : #testing }
XMLAttributeDictionary >> usesNamespaces [
	^ false
]
