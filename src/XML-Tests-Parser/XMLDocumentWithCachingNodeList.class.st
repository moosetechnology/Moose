"
A class for testing documents that use XMLCachingNodeList instead of XMLNodeList.
"
Class {
	#name : #XMLDocumentWithCachingNodeList,
	#superclass : #XMLDocument,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #defaults }
XMLDocumentWithCachingNodeList >> nodeListClass [
	^ XMLCachingNodeList
]
