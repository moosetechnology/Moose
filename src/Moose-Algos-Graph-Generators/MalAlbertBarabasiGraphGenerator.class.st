Class {
	#name : #MalAlbertBarabasiGraphGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'm0'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #configuration }
MalAlbertBarabasiGraphGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #accessing }
MalAlbertBarabasiGraphGenerator >> m0: numberOfNodes [
	m0 := numberOfNodes
]

{ #category : #running }
MalAlbertBarabasiGraphGenerator >> run [
	"Barabasi-Albert random graph generator"
	"n: number of nodes > 0"
	"m0 > 0 && m0 <  n"
	"m: number of edges  > 0 && m  <= m0"
	"http://en.wikipedia.org/wiki/Barabási–Albert_model"

	self nodes: (1 to: m0).
	self nodes
		do: [ :n1 | 
			self nodes
				do: [ :n2 | 
					n1 ~= n2
						ifTrue: [ 
							self
								addEdge:
									{(n1 model).
									(n2 model)}
								from: #first
								to: #second ] ] ].
					
		
]
