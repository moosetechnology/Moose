"
SmaCCDuplicateNodeEliminator removes duplicate nodes from a scanner's DFA.

Instance Variables:
	comparisonState	<Dictionary>	a dictionary of ""equal"" objects when testing nodes for equality
	root	<SmaCCNode>	the root node for the DFA


"
Class {
	#name : #SmaCCDuplicateNodeEliminator,
	#superclass : #SmaCCGraphAlgorithm,
	#instVars : [
		'comparisonState',
		'root'
	],
	#category : #'SmaCC_Development'
}

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator class >> removeDuplicateNodesIn: aSmaCCNode [
	^ self new removeDuplicateNodesIn: aSmaCCNode
]

{ #category : #'graph copying' }
SmaCCDuplicateNodeEliminator >> copyEdgesWith: aDictionary [
	| todo |
	todo := OrderedCollection with: root.
	[ todo notEmpty ]
		whileTrue:
			[ | node |
			node := todo removeFirst.
			(aDictionary at: node)
				transitions:
					(node sortedTransitions
						do:
							[ :each | 
							| copy |
							copy := each copy.
							copy to: (aDictionary at: each to).
							copy ]) ]
]

{ #category : #'graph copying' }
SmaCCDuplicateNodeEliminator >> copyGraph [
	| map |
	map := Dictionary new.
	self copyNodesInto: map.
	self copyEdgesWith: map.
	^ map at: root
]

{ #category : #'graph copying' }
SmaCCDuplicateNodeEliminator >> copyNodesInto: aDictionary [
	root allStates
		do: [ :each | aDictionary at: each put: each shallowCopy ]
]

{ #category : #testing }
SmaCCDuplicateNodeEliminator >> isNode: firstSmaCCNode equivalentTo: secondSmaCCNode [
	firstSmaCCNode = secondSmaCCNode
		ifTrue: [ ^ true ].
	firstSmaCCNode transitions size = secondSmaCCNode transitions size
		ifFalse: [ ^ false ].
	firstSmaCCNode action = secondSmaCCNode action
		ifFalse: [ ^ false ].
	((comparisonState at: firstSmaCCNode ifAbsent: [ #() ])
		includes: secondSmaCCNode)
		ifTrue: [ ^ true ].
	(comparisonState at: firstSmaCCNode ifAbsentPut: [ Set new ])
		add: secondSmaCCNode.
	(comparisonState at: secondSmaCCNode ifAbsentPut: [ Set new ])
		add: firstSmaCCNode.
	firstSmaCCNode sortedTransitions
		with: secondSmaCCNode sortedTransitions
		do:
			[ :first :second | 
			first transitionObjects = second transitionObjects
				ifFalse: [ ^ false ].
			(self isNode: first to equivalentTo: second to)
				ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> mergeAllTransitions [
	root allStates do: [ :each | each mergeTransitions ]
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> mergeNodeUsing: aDictionary [
	| seen todo mappings |
	mappings := Dictionary new.
	aDictionary
		keysAndValuesDo: [ :key :value | value do: [ :each | mappings at: each put: key ] ].
	seen := IdentitySet new.
	todo := OrderedCollection with: root.
	[ todo notEmpty ]
		whileTrue:
			[ | node mergedNode |
			node := todo removeFirst.
			node transitions
				do:
					[ :each | 
					(seen includes: each to)
						ifFalse: [ todo add: each to.
							seen add: each to ] ].
			mergedNode := mappings at: node ifAbsent: [ nil ].
			mergedNode notNil
				ifTrue: [ node mergeWith: mergedNode ] ]
]

{ #category : #private }
SmaCCDuplicateNodeEliminator >> pairsDo: aBlock [
	| nodes |
	nodes := root allStates asSortedCollection.
	1 to: nodes size - 1 do:
		[ :i | i + 1 to: nodes size do: [ :j | aBlock value: (nodes at: i) value: (nodes at: j) ] ]
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> removeDuplicateNodesIn: aSmaCCNode [
	root := aSmaCCNode.
	self removeDuplicates.
	self copyGraph.
	^ root
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> removeDuplicates [
	| toMerge |
	[ toMerge := Dictionary new.
	self mergeAllTransitions.
	self
		pairsDo:
			[ :firstNode :secondNode | 
			comparisonState := Dictionary new.
			(self isNode: firstNode equivalentTo: secondNode)
				ifTrue: [ (toMerge at: firstNode ifAbsentPut: [ Set new ])
						add: secondNode ] ].
	toMerge notEmpty ]
		whileTrue:
			[ toMerge values
				do: [ :each | each do: [ :node | toMerge removeKey: node ifAbsent: [  ] ] ].
			self mergeNodeUsing: toMerge ]
]
