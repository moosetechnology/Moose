Extension { #name : #XMLNodeWithElementsTest }

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testAncestorAxis [
	| nodeWithElements |

	super testAncestorAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each | | result |
		result := each %% 'node()'.
		self
			assertNodeSet: result
			hasNodes: each ancestorNodes.

		result := each %% '*'.
		self
			assertNodeSet: result
			hasNodes: each ancestorElements].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testAncestorOrSelfAxis [
	| nodeWithElements |

	super testAncestorOrSelfAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each | | result |
		result := each %%~ 'node()'.
		self
			assertNodeSet: result
			hasNodes: (each ancestorNodes copyWith: each).

		result := each %%~ '*'.
		each isElement
			ifTrue: [
				self
					assertNodeSet: result
					hasNodes: (each ancestorElements copyWith: each)]
			ifFalse: [
				self
					assertNodeSet: result
					hasNodes: each ancestorElements]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testChildAxis [
	| nodeWithElements |

	super testChildAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each |
		each hasChildren
			ifTrue: [| result |
				result := each / 'node()'.
				self
					assertNodeSet: result
					hasNodes: each nodes.
				self
					assertNodeSet: result
					hasSortOrder: XPathLevelDocumentSortOrder.

				result := each / '*'.
				self
					assertNodeSet: result
					hasNodes: each elements.
				self
					assertNodeSet: result
					hasSortOrder: XPathLevelDocumentSortOrder]
			ifFalse: [
				self
					assert: (each / 'node()') isEmpty;
					assert: (each / '*') isEmpty]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testDescendantAxis [
	| nodeWithElements |

	super testDescendantAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each |
		each hasChildren
			ifTrue: [| result |
				result := each // 'node()'.
				self
					assertNodeSet: result
					hasNodes: each descendantNodes.

				result := each // '*'.
				self
					assertNodeSet: result
					hasNodes: each descendantElements]
			ifFalse: [
				self
					assert: (each // 'node()') isEmpty;
					assert: (each // '*') isEmpty]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testDescendantOrSelfAxis [
	| nodeWithElements |

	super testDescendantOrSelfAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each |
		each hasChildren
			ifTrue: [| result |
				result := each //~ 'node()'.
				self
					assertNodeSet: result
					hasNodes: each allNodes.

				result := each //~ '*'.
				each isElement
					ifTrue: [
						self
							assertNodeSet: result
							hasNodes: each allElements]
					ifFalse: [
						self
							assertNodeSet: result
							hasNodes: each descendantElements]]
			ifFalse: [
				self
					assertNodeSet: (each //~ 'node()')
					hasNode: each.
				each isElement
					ifTrue: [
						self
							assertNodeSet: (each //~ '*')
							hasNode: each]
					ifFalse: [self assert: (each //~ '*') isEmpty]]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testFollowingAxis [
	| nodeWithElements |

	super testFollowingAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each | | result followingNodes |
		result := each >> 'node()'.
		followingNodes := 
			each hasParent
				ifTrue: [
					each parent descendantNodes copyAfter:
						(each hasChildren
							ifTrue: [each descendantNodes last]
							ifFalse: [each])]
				ifFalse: [self newNodeSet].
		self
			assertNodeSet: result
			hasNodes: followingNodes.

		result := each >> '*'.
		self
			assertNodeSet: result
			hasNodes: followingNodes elements].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testFollowingSiblingAxis [
	| nodeWithElements |

	super testFollowingSiblingAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each | | result followingSiblings |
		result := each >>> 'node()'.
		followingSiblings :=
			each hasParent
				ifTrue: [each parent nodes copyAfter: each]
				ifFalse: [self newNodeSet].
		self
			assertNodeSet: result
			hasNodes: followingSiblings.
		self
			assertNodeSet: result
			hasSortOrder: XPathLevelDocumentSortOrder.

		result := each >>> '*'.
		self
			assertNodeSet: result
			hasNodes: followingSiblings elements.
		self
			assertNodeSet: result
			hasSortOrder: XPathLevelDocumentSortOrder].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testPrecedingAxis [
	| nodeWithElements |

	super testPrecedingAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each | | result precedingNodes |
		result := each << 'node()'.
		precedingNodes :=
			each hasParent
				ifTrue: [each parent descendantNodes copyUpTo: each]
				ifFalse: [self newNodeSet].
		self
			assertNodeSet: result
			hasNodes: precedingNodes.

		result := each << '*'.
		self
			assertNodeSet: result
			hasNodes: precedingNodes elements].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithElementsTest >> testPrecedingSiblingAxis [
	| nodeWithElements |

	super testPrecedingSiblingAxis.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each | | result precedingSiblings |
		result := each <<< 'node()'.
		precedingSiblings :=
			each hasParent
				ifTrue: [each parent nodes copyUpTo: each]
				ifFalse: [self newNodeSet].
		self
			assertNodeSet: result
			hasNodes: precedingSiblings.
		self
			assertNodeSet: result
			hasSortOrder: XPathLevelDocumentSortOrder.

		result := each <<< '*'.
		self
			assertNodeSet: result
			hasNodes: precedingSiblings elements.
		self
			assertNodeSet: result
			hasSortOrder: XPathLevelDocumentSortOrder].
]
