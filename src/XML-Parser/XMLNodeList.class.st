"
This class represents an ordered list of child nodes for an XML document or element. Non-modifying accessing messages like #first and #last return nil instead of raising exceptions.
"
Class {
	#name : #XMLNodeList,
	#superclass : #XMLObservableList,
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLNodeList class >> new [
	^ self new: 5
]

{ #category : #private }
XMLNodeList >> afterAdding: aNode at: anIndex [
	(aNode hasParentWithNodeList: self)
		ifTrue: [
			self
				removeDuplicateOf: aNode
				notAt: anIndex]
		ifFalse: [
			observer
				ifNotNil: [observer addedNode: aNode]]
]

{ #category : #private }
XMLNodeList >> afterAddingLast: aNode [
	(aNode hasParentWithNodeList: self)
		ifTrue: [
			self
				removeDuplicateOf: aNode
				notAt: self size]
		ifFalse: [
			observer
				ifNotNil: [observer addedNode: aNode]]
]

{ #category : #private }
XMLNodeList >> afterAddingToCopyLast: aNode [
	observer
		ifNotNil: [observer addedNode: aNode]
]

{ #category : #private }
XMLNodeList >> afterRemoving: aNode [
	observer
		ifNotNil: [observer removedNode: aNode]
]

{ #category : #accessing }
XMLNodeList >> contentNodes [
	^ self select: [:each | each isContentNode]
]

{ #category : #enumerating }
XMLNodeList >> contentNodesDo: aBlock [
	self do: [:each |
		each isContentNode
			ifTrue: [aBlock value: each]]
]

{ #category : #accessing }
XMLNodeList >> contentStringAt: aName [
	^ (self
		elementAt: aName
		ifAbsent: [^ '']) contentString
]

{ #category : #accessing }
XMLNodeList >> elementAfter: anElement [
	| last |

	self elementsDo: [:each |
		last = anElement
			ifTrue: [^ each].
		last := each].
	^ self defaultValue.
]

{ #category : #accessing }
XMLNodeList >> elementAt: aName [
	^ self
		elementAt: aName
		ifAbsent: [self defaultValue]
]

{ #category : #accessing }
XMLNodeList >> elementAt: aName ifAbsent: aBlock [
	self elementsDo: [:each |
		(each isNamed: aName)
			ifTrue: [^ each]].
	^ aBlock value.
]

{ #category : #accessing }
XMLNodeList >> elementAt: aName namespaceURI: aURI [
	^ self
		elementAt: aName
		namespaceURI: aURI
		ifAbsent: [self defaultValue]
]

{ #category : #accessing }
XMLNodeList >> elementAt: aName namespaceURI: aURI ifAbsent: aBlock [
	self
		elementsAt: aName
		do: [:each |
			each namespaceURI = aURI
				ifTrue: [^ each]].
	^ aBlock value.
]

{ #category : #accessing }
XMLNodeList >> elementBefore: anElement [
	| last |

	last := self defaultValue.
	self elementsDo: [:each |
		each = anElement
			ifTrue: [^ last].
		last := each].
	^ self defaultValue.
]

{ #category : #accessing }
XMLNodeList >> elementNames [
	^ self elementsCollect: [:each | each name]
]

{ #category : #accessing }
XMLNodeList >> elements [
	^ self select: [:each | each isElement]
]

{ #category : #accessing }
XMLNodeList >> elementsAt: aName [
	^ self elementsSelect: [:each | each isNamed: aName]
]

{ #category : #enumerating }
XMLNodeList >> elementsAt: aName do: aBlock [
	self elementsDo: [:each |
		(each isNamed: aName)
			ifTrue: [aBlock value: each]]
]

{ #category : #accessing }
XMLNodeList >> elementsAt: aName namespaceURI: aURI [
	^ self elementsSelect: [:each |
		(each isNamed: aName)
			and: [each namespaceURI = aURI]]
]

{ #category : #enumerating }
XMLNodeList >> elementsCollect: aBlock [
	| collectedElements |

	"implementing with #elementsDo: benefits the caching subclass because
	of its fast #elementsDo: implementation"
	collectedElements := self copyEmptyForCollect.
	self elementsDo: [:each |
		collectedElements addLast: (aBlock value: each)].
	^ collectedElements.
]

{ #category : #enumerating }
XMLNodeList >> elementsDetect: aBlock [
	^ self
		elementsDetect: aBlock
		ifNone: [self defaultValue]
]

{ #category : #enumerating }
XMLNodeList >> elementsDetect: aBlock ifNone: anExceptionBlock [
	"implementing with #elementsDo: benefits the caching subclass because
	of its fast #elementsDo: implementation"
	self elementsDo: [:each |
		(aBlock value: each)
			ifTrue: [^ each]].
	^ anExceptionBlock value.
]

{ #category : #enumerating }
XMLNodeList >> elementsDo: aBlock [
	"use #to:do: for performance, because so many methods rely on this"
	1 to: collection size do: [:i | | node |
		(node := collection at: i) isElement
			ifTrue: [aBlock value: node]]
]

{ #category : #enumerating }
XMLNodeList >> elementsSelect: aBlock [
	| selectedElements |

	"implementing with #elementsDo: benefits the caching subclass because
	of its fast #elementsDo: implementation"
	selectedElements := self copyEmpty.
	self elementsDo: [:each |
		(aBlock value: each)
			ifTrue: [selectedElements addToCopyLast: each]].
	^ selectedElements.
]

{ #category : #accessing }
XMLNodeList >> firstElement [
	self elementsDo: [:each | ^ each].
	^ self defaultValue.
]

{ #category : #testing }
XMLNodeList >> hasContentNodes [
	^ self anySatisfy: [:each | each isContentNode]
]

{ #category : #testing }
XMLNodeList >> hasElements [
	^ self anySatisfy: [:each | each isElement]
]

{ #category : #testing }
XMLNodeList >> hasStringNodes [
	^ self anySatisfy: [:each | each isStringNode]
]

{ #category : #testing }
XMLNodeList >> includesElement: aName [
	self
		elementAt: aName
		ifAbsent: [^ false].
	^ true.
]

{ #category : #testing }
XMLNodeList >> includesElement: aName namespaceURI: aURI [
	self
		elementAt: aName
		namespaceURI: aURI
		ifAbsent: [^ false].
	^ true.
]

{ #category : #accessing }
XMLNodeList >> lastElement [
	self reverseDo: [:each |
		each isElement
			ifTrue: [^ each]].
	^ self defaultValue.
]

{ #category : #accessing }
XMLNodeList >> rawContentStringAt: aName [
	^ (self
		elementAt: aName
		ifAbsent: [^ '']) rawContentString
]

{ #category : #notifying }
XMLNodeList >> renamedElement: anElement from: anOldName to: aNewName [
]

{ #category : #sorting }
XMLNodeList >> sort [
	self sort: [:a :b | a sortKey <= b sortKey]
]

{ #category : #accessing }
XMLNodeList >> stringNodes [
	^ self select: [:each | each isStringNode]
]

{ #category : #enumerating }
XMLNodeList >> stringNodesDo: aBlock [
	self do: [:each |
		each isStringNode
			ifTrue: [aBlock value: each]]
]

{ #category : #accessing }
XMLNodeList >> strings [
	^ self
		select: [:each | each isStringNode]
		thenCollect: [:each | each string]
]

{ #category : #enumerating }
XMLNodeList >> stringsDo: aBlock [
	self stringNodesDo: [:each | aBlock value: each string]
]
