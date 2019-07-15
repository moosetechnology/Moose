"
This class sorts an unsorted node set into document order in linear time by traversing the document or just the nodes of a shared parent. (faster in tests on average than #sort: with a backtracking node order comparison block)
"
Class {
	#name : #XPathNodeSetSorter,
	#superclass : #Object,
	#instVars : [
		'nodeSet',
		'nodeSetSize',
		'nodeSetCollection',
		'nodeSetSet',
		'mustVisitNamespaces',
		'mustVisitAttributes',
		'totalSorted'
	],
	#category : #'XPath-Core-DOM'
}

{ #category : #'instance creation' }
XPathNodeSetSorter class >> on: aNodeSet [
	^ self new on: aNodeSet
]

{ #category : #private }
XPathNodeSetSorter >> errorNodesLackSharedDocumentRoot [
	XPathDOMException signal: 'Cannot sort nodes without shared document root'
]

{ #category : #initialization }
XPathNodeSetSorter >> on: aNodeSet [
	"save the internal state of the node set to inst vars for
	performance and to simplify code"
	nodeSet := aNodeSet.
	nodeSetSize := aNodeSet size.
	nodeSetCollection := aNodeSet collection.
	nodeSetSet := aNodeSet set.

	mustVisitNamespaces := false.
	mustVisitAttributes := false.
	totalSorted := 0.
]

{ #category : #private }
XPathNodeSetSorter >> prescanNodesForSharedParent [
	"check if all nodes in the node set have the same parent so sorting
	can be done quicker and if there are no attributes or namespaces
	in the node set so they can be ignored during sorting"

	| sharedParent |

	sharedParent := nodeSetCollection first parent.

	"we could breakout once sharedParent is nil (there isn't one) and
	mustVisitNamespaces and mustVisitAttributes are both true, because
	no more info is needed, but that's so uncommon (attributes and namespace
	nodes in a node set and no shared parent) that it's not worth testing for
	each iteration"
	nodeSetCollection do: [:each |
		each isNamespace
			ifTrue: [mustVisitNamespaces := true]
			ifFalse: [
				each isAttribute
					ifTrue: [mustVisitAttributes := true]].
		sharedParent
			ifNotNil: [
				each parent == sharedParent
					ifFalse: [sharedParent := nil]]].
	^ sharedParent.
]

{ #category : #sorting }
XPathNodeSetSorter >> sort [
	nodeSetSize > 1
		ifTrue: [
			self prescanNodesForSharedParent
				ifNil: [self sortVisitingAllNodes]
				ifNotNil: [:sharedParent |
					self sortVisitingNodesOfSharedParent: sharedParent]].
	nodeSet sortOrder: XPathDocumentSortOrder new.
]

{ #category : #private }
XPathNodeSetSorter >> sortVisitingAllNodes [
	nodeSetCollection first documentRoot allNodesDo: [:node |
		self visitNode: node.
		node isElement
			ifTrue: [
				(mustVisitNamespaces
					and: [node hasNamespaceNodes])
					ifTrue: [
						node namespaceNodesDo: [:each |
							self visitNode: each]].
				(mustVisitAttributes
					and: [node hasAttributes])
					ifTrue: [
						node attributeNodesDo: [:each |
							self visitNode: each]]].
		"can abort when every node in the node set has been visited"
		totalSorted = nodeSetSize
			ifTrue: [^ self]].

	"if we got here, then at least one node must not belong to the same
	document as the rest, because otherwise it would have been visited"
	self errorNodesLackSharedDocumentRoot.
]

{ #category : #private }
XPathNodeSetSorter >> sortVisitingNodesOfSharedParent: aSharedParent [
	"all nodes in the node set have the same parent, so only its
	namespaces and attributes (if any are in the node set) and
	children need to be visited"
	mustVisitNamespaces
		ifTrue: [
			aSharedParent namespaceNodesDo: [:each |
				self visitNode: each]].
	mustVisitAttributes
		ifTrue: [
			aSharedParent attributeNodesDo: [:each |
				self visitNode: each]].
	aSharedParent hasChildren
		ifTrue: [
			aSharedParent nodesDo: [:each |
				self visitNode: each]].
]

{ #category : #private }
XPathNodeSetSorter >> visitNode: aNode [
	(nodeSetSet includes: aNode)
		ifTrue: [
			nodeSetCollection
				at: (totalSorted := totalSorted + 1)
				put: aNode]
]
