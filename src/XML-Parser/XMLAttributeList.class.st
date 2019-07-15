"
This class represents an ordered list of attribute nodes. It is not the default attribute list class, but it can be used by injecting it into a DOM parser before parsing:
	(parser := XMLDOMParser on: xmlSource)
		nodeFactory:
			(XMLPluggableNodeFactory new
				attributeListClass: XMLAttributeList);
		parseDocument.

It should be used over the default class when you want to reduce memory use at the cost of slower attribute lookup.
"
Class {
	#name : #XMLAttributeList,
	#superclass : #XMLObservableList,
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLAttributeList class >> new [
	^ self new: 5
]

{ #category : #adding }
XMLAttributeList >> addAttributeAssociation: anAssociation [
	^ self
		addAttributeName: anAssociation key
		value: anAssociation value
]

{ #category : #adding }
XMLAttributeList >> addAttributeName: aName value: aValue [
	^ self addLast:
		(self attributeClass
			name: aName
			value: aValue)
]

{ #category : #private }
XMLAttributeList >> afterAdding: aNode at: anIndex [
	(self
		removeDuplicateOf: aNode
		notAt: anIndex)
		ifNotNil: [:duplicate |
			duplicate = aNode
				ifTrue: [^ self]].
	observer
		ifNotNil: [observer addedAttribute: aNode].
]

{ #category : #private }
XMLAttributeList >> afterAddingLast: aNode [
	(self
		removeDuplicateOf: aNode
		notAt: self size)
		ifNotNil: [:duplicate |
			duplicate = aNode
				ifTrue: [^ self]].
	observer
		ifNotNil: [observer addedAttribute: aNode].
]

{ #category : #private }
XMLAttributeList >> afterAddingToCopyLast: aNode [
	observer
		ifNotNil: [observer addedAttribute: aNode]
]

{ #category : #private }
XMLAttributeList >> afterRemoving: aNode [
	observer
		ifNotNil: [observer removedAttribute: aNode].
]

{ #category : #converting }
XMLAttributeList >> asDictionary [
	^ self attributes
]

{ #category : #accessing }
XMLAttributeList >> attributeAssociations [
	^ self collect: [:each | each name -> each value]
]

{ #category : #accessing }
XMLAttributeList >> attributeAt: aName [
	^ self attributeValueAt: aName
]

{ #category : #accessing }
XMLAttributeList >> attributeAt: aName ifAbsent: aBlock [
	^ self
		attributeValueAt: aName
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLAttributeList >> attributeAt: aName ifAbsentPut: aBlock [
	^ self
		attributeValueAt: aName
		ifAbsentPut: aBlock
]

{ #category : #accessing }
XMLAttributeList >> attributeAt: aName put: aValue [
	^ self
		attributeValueAt: aName
		put: aValue
]

{ #category : #defaults }
XMLAttributeList >> attributeClass [
	"Can be overridden in subclasses to use a custom attribute class"

	^ XMLAttribute

]

{ #category : #accessing }
XMLAttributeList >> attributeNames [
	^ self collect: [:each | each name]
]

{ #category : #enumerating }
XMLAttributeList >> attributeNamesAndValuesDo: aTwoArgumentBlock [
	self do: [:each |
		aTwoArgumentBlock
			value: each name
			value: each value]
]

{ #category : #enumerating }
XMLAttributeList >> attributeNamesDo: aBlock [
	self do: [:each | aBlock value: each name]
]

{ #category : #accessing }
XMLAttributeList >> attributeNodeAt: aName [
	^ self
		attributeNodeAt: aName
		ifAbsent: [self defaultValue]
]

{ #category : #accessing }
XMLAttributeList >> attributeNodeAt: aName ifAbsent: aBlock [
	self do: [:each |
		(each isNamed: aName)
			ifTrue: [^ each]].
	^ aBlock value.
]

{ #category : #accessing }
XMLAttributeList >> attributeNodeAt: aName namespaceURI: aURI [
	^ self
		attributeNodeAt: aName
		namespaceURI: aURI
		ifAbsent: [self defaultValue]
]

{ #category : #accessing }
XMLAttributeList >> attributeNodeAt: aName namespaceURI: aURI ifAbsent: aBlock [
	self do: [:each |
		((each isNamed: aName)
			and: [each namespaceURI = aURI])
			ifTrue: [^ each]].
	^ aBlock value.
]

{ #category : #private }
XMLAttributeList >> attributeValueAt: aName [
	^ self
		attributeValueAt: aName
		ifAbsent: ['']
]

{ #category : #private }
XMLAttributeList >> attributeValueAt: aName ifAbsent: aBlock [
	| i |

	^ (i := self indexOfAttributeValueAt: aName) > 0
		ifTrue: [(self at: i) value]
		ifFalse: [aBlock value]
]

{ #category : #private }
XMLAttributeList >> attributeValueAt: aName ifAbsentPut: aBlock [
	^ self
		attributeValueAt: aName
		ifAbsent: [
			"use #addToCopyLast:, since we know it's not in the collection"
			(self addToCopyLast:
				(self attributeClass
					name: aName
					value: aBlock value)) value]
]

{ #category : #private }
XMLAttributeList >> attributeValueAt: aName put: aValue [
	| i |

	(i := self indexOfAttributeValueAt: aName) > 0
		ifTrue: [(self at: i) value: aValue]
		ifFalse: [
			"use #addToCopyLast: since we know it's not already in the collection"
			self addToCopyLast:
				(self attributeClass
					name: aName
					value: aValue)].
	^ aValue.
]

{ #category : #accessing }
XMLAttributeList >> attributes [
	| dictionary |

	dictionary := self attributesClass new: self size.
	self do: [:each |
		dictionary
			at: each name
			put: each value].
	^ dictionary.
]

{ #category : #defaults }
XMLAttributeList >> attributesClass [
	"Can be overridden in subclasses to use a custom collection
	class for #attributes to use when returning attribute associations"

	^ OrderPreservingStringDictionary
]

{ #category : #private }
XMLAttributeList >> duplicateIndexOf: aNode notAt: anIndex [
	"like the superclass version, but it considers nodes with
	the same name to be duplicates"
	1 to: anIndex - 1 do: [:i | | node |
		(node := collection at: i) name = aNode name
			ifTrue: [^ i]].

	anIndex + 1 to: collection size do: [:i | | node |
		(node := collection at: i) name = aNode name
			ifTrue: [^ i]].

	^ 0.
]

{ #category : #testing }
XMLAttributeList >> includesAttribute: aName [
	^ (self indexOfAttributeValueAt: aName) > 0
]

{ #category : #testing }
XMLAttributeList >> includesAttributeNode: aName [
	self
		attributeNodeAt: aName
		ifAbsent: [^ false].
	^ true.
]

{ #category : #testing }
XMLAttributeList >> includesAttributeNode: aName namespaceURI: aURI [
	self
		attributeNodeAt: aName
		namespaceURI: aURI
		ifAbsent: [^ false].
	^ true.
]

{ #category : #private }
XMLAttributeList >> indexOfAttributeValueAt: aName [
	"Returns the index of the attribute value with the exact name of aName"

	"this needs to be fast, for #attributeValueAt:... methods, so
	use #to:do: for speed"
	1 to: collection size do: [:i | | node |
		(node := collection at: i) name = aName
			ifTrue: [^ i]].
	^ 0.
]

{ #category : #removing }
XMLAttributeList >> removeAttribute: aName [
	^ (self removeAt: (self indexOfAttributeValueAt: aName)) value
]

{ #category : #removing }
XMLAttributeList >> removeAttribute: aName ifAbsent: aBlock [
	| i |

	(i := self indexOfAttributeValueAt: aName) > 0
		ifTrue: [^ (self removeAt: i) value]
		ifFalse: [^ aBlock value].
]

{ #category : #notifying }
XMLAttributeList >> renamedAttribute: anAttribute from: anOldName to: aNewName [
	self
		removeDuplicateOf: anAttribute
		notAt: (self indexOf: anAttribute)
]

{ #category : #initialization }
XMLAttributeList >> setAttributes: anAssociationCollection [
	self removeAll.
	anAssociationCollection associationsDo: [:each |
		self addAttributeAssociation: each].
]

{ #category : #private }
XMLAttributeList >> setAttributesFromOrderPreservingDictionary: anOrderPreservingDictionary [
	"This should only be sent by DOM parsers/builders, not public API users"
	| orderedKeys |

	"Add the XMLAttributes in order directly to the collection to avoid
	sending notifications that would do unneeded, costly namespace prefix
	revalidation.
	Use the internal #orderedKeys with #to:do: to create an inlined #keysDo:
	without block closure overhead."
	orderedKeys := anOrderPreservingDictionary orderedKeys.
	1 to: anOrderPreservingDictionary size do: [:i | | key |
		key := orderedKeys at: i.
		collection addLast: 
			(self attributeClass new
				setName: key
				value:
					"use dictionary at:ifAbsent: for speed over at:"
					(anOrderPreservingDictionary
						at: key
						ifAbsent: nil)
				element: observer)].
]

{ #category : #sorting }
XMLAttributeList >> sort [
	self sort: [:a :b | a sortKey <= b sortKey]
]

{ #category : #private }
XMLAttributeList >> writeAttributesOn: aWriter [
	"use #to:do: with direct access for fast writing"
	1 to: collection size do: [:i | | attribute |
		attribute := collection at: i.
		aWriter
			writeAttributeName: attribute name
			value: attribute value]
]

{ #category : #private }
XMLAttributeList >> writeCanonicalAttributesOn: aWriter [
	| sortedAttributes |

	(sortedAttributes := self asArray) sort: [:a :b | | prefixOfA prefixOfB |
		prefixOfA := a prefix.
		prefixOfB := b prefix.
		prefixOfA = prefixOfB
			ifTrue: [
				(a name xmlLocalNameAfterPrefix: prefixOfA)
					<= (b name xmlLocalNameAfterPrefix: prefixOfB)]
			ifFalse: [| uriOfA uriOfB |
				"the namespace URI is the primary key and
				the local name is the secondary key"
				uriOfA := a resolvePrefix: prefixOfA.
				uriOfB := b resolvePrefix: prefixOfB.
				uriOfA < uriOfB
					or: [
						uriOfA = uriOfB
							and: [
								(a name xmlLocalNameAfterPrefix: prefixOfA)
									<= (b name xmlLocalNameAfterPrefix: prefixOfB)]]]].

	"use #to:do: for fast writing"
	1 to: sortedAttributes size do: [:i | | attribute |
		attribute := sortedAttributes at: i.
		aWriter
			writeAttributeName: attribute name
			value: attribute value].
]
