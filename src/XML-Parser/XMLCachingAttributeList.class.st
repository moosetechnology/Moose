"
This class represents an ordered list of attribute nodes that also keeps a dictionary mapping attribute names to nodes for faster lookup.

This is the default attribute list class.
"
Class {
	#name : #XMLCachingAttributeList,
	#superclass : #XMLAttributeList,
	#instVars : [
		'attributeNodesByName'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #private }
XMLCachingAttributeList >> afterAdding: aNode at: anIndex [
	self attributeNodesByName
		at: aNode name ifPresent: [:duplicate |
			self
				removeDuplicateOf: aNode
				notAt: anIndex.
			duplicate = aNode
				ifTrue: [^ self]];
		at: aNode name put: aNode.
	observer
		ifNotNil: [observer addedAttribute: aNode].
]

{ #category : #private }
XMLCachingAttributeList >> afterAddingLast: aNode [
	self attributeNodesByName
		at: aNode name ifPresent: [:duplicate |
			self
				removeDuplicateOf: aNode
				notAt: self size.
			duplicate = aNode
				ifTrue: [^ self]];
		at: aNode name put: aNode.
	observer
		ifNotNil: [observer addedAttribute: aNode].
]

{ #category : #private }
XMLCachingAttributeList >> afterAddingToCopyLast: aNode [
	self attributeNodesByName
		at: aNode name
		put: aNode.
	observer
		ifNotNil: [observer addedAttribute: aNode].
]

{ #category : #private }
XMLCachingAttributeList >> afterRemoving: aNode [
	self attributeNodesByName removeKey: aNode name.
	observer
		ifNotNil: [observer removedAttribute: aNode].
]

{ #category : #private }
XMLCachingAttributeList >> attributeNodesByName [
	^ attributeNodesByName
		ifNil: [attributeNodesByName := Dictionary new: self capacity]
]

{ #category : #private }
XMLCachingAttributeList >> attributeValueAt: aName ifAbsent: aBlock [
	^ (self attributeNodesByName
		at: aName
		ifAbsent: [^ aBlock value]) value
]

{ #category : #private }
XMLCachingAttributeList >> attributeValueAt: aName put: aValue [
	(self attributeNodesByName
		at: aName
		ifAbsent: [
			"use #addToCopyLast: since we know it's not already in the collection"
			self addToCopyLast:
				(self attributeClass
					name: aName
					value: aValue).
			^ aValue]) value: aValue.
	^ aValue.
]

{ #category : #defaults }
XMLCachingAttributeList >> copyClass [
	"use the non-caching superclass for copies for performance"
	^ XMLAttributeList
]

{ #category : #testing }
XMLCachingAttributeList >> includes: aNode [
	^ aNode isAttribute
		and: [
			(self attributeNodesByName
				at: aNode name
				ifAbsent: [^ false]) = aNode]
]

{ #category : #testing }
XMLCachingAttributeList >> includesAttribute: aName [
	^ self attributeNodesByName includesKey: aName
]

{ #category : #private }
XMLCachingAttributeList >> indexOfAttributeValueAt: aName [
	^ (self attributeNodesByName includesKey: aName)
		ifTrue: [super indexOfAttributeValueAt: aName]
		ifFalse: [0]
]

{ #category : #removing }
XMLCachingAttributeList >> removeAttribute: aName [
	^ (self remove: (self attributeNodesByName at: aName)) value
]

{ #category : #removing }
XMLCachingAttributeList >> removeAttribute: aName ifAbsent: aBlock [
	^ (self remove:
		(self attributeNodesByName
			at: aName
			ifAbsent: [^ aBlock value])) value
]

{ #category : #notifying }
XMLCachingAttributeList >> renamedAttribute: anAttribute from: anOldName to: aNewName [
	self attributeNodesByName
		removeKey: anOldName;
		at: aNewName ifPresent: [:duplicate |
			self
				removeDuplicateOf: anAttribute
				notAt: (self indexOf: anAttribute)];
		at: aNewName put: anAttribute
]

{ #category : #private }
XMLCachingAttributeList >> setAttributesFromOrderPreservingDictionary: anOrderPreservingDictionary [
	"This should only be sent by DOM parsers/builders, not public API users"
	| orderedKeys |

	"Hack to reuse its internal dictionary for speed, which we will
	modify the association values of. This is safe because the DOM
	parser/builder will never use it again."
	attributeNodesByName := anOrderPreservingDictionary dictionary.

	"Add the XMLAttributes in order directly to the collection to avoid
	sending notifications that would do unneeded, costly namespace prefix
	revalidation and also replace the value in the attributeNodesByName
	association with the new XMLAttribute.
	Use the internal #orderedKeys with #to:do: to create an inlined #keysDo:
	without block closure overhead."
	orderedKeys := anOrderPreservingDictionary orderedKeys.
	1 to: anOrderPreservingDictionary size do: [:i | | key association |
		key := orderedKeys at: i.
		"use associationAt:ifAbsent: for speed over associationAt:"
		association :=
			attributeNodesByName
				associationAt: key
				ifAbsent: nil.
		"replace its string value with the new XMLAttribute"
		association value:
			(collection addLast: 
				(self attributeClass new
					setName: key
					value: association value
					element: observer))].
]
