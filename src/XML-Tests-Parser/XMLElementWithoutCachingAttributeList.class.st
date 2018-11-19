"
A class for testing elements that use XMLAttributeList instead of XMLCachingAttributeList.
"
Class {
	#name : #XMLElementWithoutCachingAttributeList,
	#superclass : #XMLElement,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #defaults }
XMLElementWithoutCachingAttributeList >> attributeListClass [
	^ XMLAttributeList
]
