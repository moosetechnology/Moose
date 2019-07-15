"
This class represents the list of nodes that comprise a document's internal DTD subset.
"
Class {
	#name : #XMLInternalSubsetList,
	#superclass : #XMLObservableList,
	#category : #'XML-Parser-DOM'
}

{ #category : #private }
XMLInternalSubsetList >> afterAdding: aNode at: anIndex [
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
XMLInternalSubsetList >> afterAddingLast: aNode [
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
XMLInternalSubsetList >> afterAddingToCopyLast: aNode [
	observer
		ifNotNil: [observer addedNode: aNode]
]

{ #category : #private }
XMLInternalSubsetList >> afterRemoving: aNode [
	observer ifNotNil: [observer removedNode: aNode]
]

{ #category : #sorting }
XMLInternalSubsetList >> sort [
	self sort: [:a :b | a sortKey <= b sortKey]
]
