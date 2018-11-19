Class {
	#name : #XMLDocumentWithCachingNodeListTest,
	#superclass : #XMLDocumentTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLDocumentWithCachingNodeListTest >> elementClass [
	^ XMLElementWithCachingNodeList
]

{ #category : #accessing }
XMLDocumentWithCachingNodeListTest >> nodeClass [
	^ XMLDocumentWithCachingNodeList
]

{ #category : #accessing }
XMLDocumentWithCachingNodeListTest >> nodeListClass [
	^ XMLCachingNodeList
]
