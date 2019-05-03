Class {
	#name : #MalWaltzStrogatzGraphGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'k'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #running }
MalWaltzStrogatzGraphGenerator >> buildRegularLattice [
	| graph n |
	graph := self nodes.
	n := graph size.
	1 to: n do: [ :i | |e|
		e := k /2.
		(i - e - 1)  to: (i + e - 1)
			do: [ :j |
				self
					addEdge:
						{(graph at: i) model.
						(graph at: j \\ n +1) model}
					from: #first
					to: #second ] ]
]

{ #category : #configuration }
MalWaltzStrogatzGraphGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #accessing }
MalWaltzStrogatzGraphGenerator >> k: aValue [
	k := aValue
]

{ #category : #running }
MalWaltzStrogatzGraphGenerator >> rewireRandomly [
	" | numberOfNodes |
numberOfNodes := self nodes size.
	self edges
		do: [ :e | 
			100 atRandom / 100 < beta
				ifTrue: [ 
					[ k := numberOfNodes atRandom  ] repeatUntil: (true).
						
					 ] ]"
]

{ #category : #running }
MalWaltzStrogatzGraphGenerator >> run [
	self buildRegularLattice.
	self rewireRandomly
]
