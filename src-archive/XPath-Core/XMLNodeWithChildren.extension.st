Extension { #name : #XMLNodeWithChildren }

{ #category : #'*XPath-Core-enumerating' }
XMLNodeWithChildren >> allNodesReverseDo: aBlock [
	self hasChildren
		ifTrue: [self nodes reverseDo: [:each | each allNodesReverseDo: aBlock]].
	aBlock value: self.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> childAxisAnySatisfy: aNodeTest [
	^ self hasChildren
		and: [self nodes anySatisfy: aNodeTest]
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> childAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	(aPosition > 0
		and: [self hasChildren
			and: [self nodes size >= aPosition]])
		ifFalse: [^ aNodeSet].

	aNodeTest isAnyNodeTest
		ifTrue: [
			aNodeSet addLast:
				(self nodes at: aPosition)]
		ifFalse: [| totalMatched nodeList |
			totalMatched := 0.
			"use to:do: with direct access for speed"
			nodeList := self nodes.
			1 to: nodeList size do: [:i | | node |
				node := nodeList at: i.
				((aNodeTest value: node)
					and: [(totalMatched := totalMatched + 1) = aPosition])
					ifTrue: [
						aNodeSet addLast: node.
						^ aNodeSet]]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> childAxisSelect: aNodeTest into: aNodeSet [
	self hasChildren
		ifTrue: [| nodeList |
			"use to:do: with direct access for speed"
			nodeList := self nodes.
			1 to: nodeList size do: [:i | | node |
				node := nodeList at: i.
				(aNodeTest value: node)
					ifTrue: [aNodeSet addLast: node]]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantAxisAnySatisfy: aNodeTest [
	self descendantNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self descendantNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self descendantNodesDo: [:each |
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantAxisSelect: aNodeTest into: aNodeSet [
	self descendantNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantOrSelfAxisAnySatisfy: aNodeTest [
	self allNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantOrSelfAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self allNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantOrSelfAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self allNodesDo: [:each |
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNodeWithChildren >> descendantOrSelfAxisSelect: aNodeTest into: aNodeSet [
	self allNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]
