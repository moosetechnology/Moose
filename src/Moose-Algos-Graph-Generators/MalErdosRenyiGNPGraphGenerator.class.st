Class {
	#name : #MalErdosRenyiGNPGraphGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'probability'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #configuration }
MalErdosRenyiGNPGraphGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #running }
MalErdosRenyiGNPGraphGenerator >> probability: aProbability [
	probability := aProbability
]

{ #category : #running }
MalErdosRenyiGNPGraphGenerator >> run [
	"G(n,p) Erdos-Renyi random graph generator"
	"n: number of nodes >0"
	"Linking every node with each other with probability p (no self-loops)"
	"https://en.wikipedia.org/wiki/Erd%C5%91s%E2%80%93R%C3%A9nyi_model"

	self nodes
		do: [ :n1 | 
			self nodes
				do: [ :n2 | 
					n1 ~= n2
						ifTrue: [ 
							100 atRandom / 100 < probability
								ifTrue: [ 
									self
										addEdge:
											{n1 model.
											n2 model}
										from: #first
										to: #second ] ] ] ]
]
