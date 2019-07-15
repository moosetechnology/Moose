"
A sort order for unsorted nodes or nodes in an unknown sort order.
"
Class {
	#name : #XPathUnknownSortOrder,
	#superclass : #XPathSortOrder,
	#category : #'XPath-Core-DOM'
}

{ #category : #converting }
XPathUnknownSortOrder >> asReversedSortOrder [
	^ self
]

{ #category : #sorting }
XPathUnknownSortOrder >> documentOrderSort: aNodeSet [
	(XPathNodeSetSorter on: aNodeSet) sort
]

{ #category : #sorting }
XPathUnknownSortOrder >> documentOrderSorted: aNodeSet [
	^ aNodeSet sorted
]

{ #category : #accessing }
XPathUnknownSortOrder >> firstInDocumentOrderFrom: aNodeSet [
	^ aNodeSet sorted first
]
