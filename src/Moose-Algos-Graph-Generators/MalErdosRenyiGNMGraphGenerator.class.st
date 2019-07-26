Class {
	#name : #MalErdosRenyiGNMGraphGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'edgesNumber'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #configuration }
MalErdosRenyiGNMGraphGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #accessing }
MalErdosRenyiGNMGraphGenerator >> edgesNumber: m [
	edgesNumber := m
]

{ #category : #running }
MalErdosRenyiGNMGraphGenerator >> run [
	"G(n,m) Erdos-Renyi random graph generator"
	"n: number of nodes >0"
	"m: number of edges >=0"
	"m <= n*(n-1/2"
	"https://en.wikipedia.org/wiki/Erd%C5%91s%E2%80%93R%C3%A9nyi_model"

	edgesNumber
		timesRepeat: [ 
			| source target |
			source := self nodes atRandom.
			target := ((self nodes copy)
				remove: source;
				yourself) atRandom.
			self
				addEdge:
					{source model.
					target model}
				from: #first
				to: #second]
]
