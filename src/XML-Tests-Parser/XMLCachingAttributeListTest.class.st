Class {
	#name : #XMLCachingAttributeListTest,
	#superclass : #XMLAttributeListTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLCachingAttributeListTest >> listClass [
	^ XMLCachingAttributeList
]

{ #category : #accessing }
XMLCachingAttributeListTest >> listCopyClass [
	^ XMLAttributeList
]
