Class {
	#name : #XMLCachingNodeListTest,
	#superclass : #XMLNodeListTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLCachingNodeListTest >> listClass [
	^ XMLCachingNodeList
]

{ #category : #accessing }
XMLCachingNodeListTest >> listCopyClass [
	^ XMLNodeList
]

{ #category : #tests }
XMLCachingNodeListTest >> testSort [
	| list cachedElements |

	super testSort.

	list := self listWithItems.
	cachedElements := list elements.
	list sort: self reverseSortBlock.
	self assert: list elements = (cachedElements sort: self reverseSortBlock).
]

{ #category : #tests }
XMLCachingNodeListTest >> testSwapWith [
	| list cachedElements start end |

	super testSwapWith.

	list := self listWithItems.
	cachedElements := list elements.
	start := 1.
	end := list size.
	[start < end]
		 whileTrue: [
			list swap: start with: end.
			start := start + 1.
			end := end - 1].
	self assert: list elements = cachedElements reversed.
]
