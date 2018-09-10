"
A class for testing elements that use XMLCachingNodeList instead of XMLNodeList.
"
Class {
	#name : #XMLElementWithCachingNodeList,
	#superclass : #XMLElement,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #defaults }
XMLElementWithCachingNodeList >> nodeListClass [
	^ XMLCachingNodeList
]
