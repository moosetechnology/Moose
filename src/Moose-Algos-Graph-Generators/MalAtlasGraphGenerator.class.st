"
I'm able to build graphs described in the Atlas of Graphs.

See ""An Atlas of Graphs"" by Ronald C. Read and Robin J. Wilson,
Oxford University Press, 1998.


"
Class {
	#name : #MalAtlasGraphGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'edgesArray'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #'0 node' }
MalAtlasGraphGenerator class >> G0 [
	^ self new edgesArray: #()
]

{ #category : #'1 node' }
MalAtlasGraphGenerator class >> G1 [
	^ self new
		nodes: (1 to: 1);
		edgesArray: #()
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G10 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(4 3) #(4 2))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G11 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(1 2) #(4 3))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G12 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(4 3) #(2 3) #(4 2))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G13 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(4 1) #(4 2) #(4 3))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G14 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(1 2) #(2 3) #(1 4))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G15 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(4 3) #(2 3) #(4 2) #(4 1))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G16 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(1 2) #(2 3) #(3 4) #(1 4))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G17 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(1 2) #(1 3) #(1 4) #(2 3) #(3 4))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G18 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(1 2) #(1 3) #(1 4) #(2 3) #(3 4))
]

{ #category : #'2 nodes' }
MalAtlasGraphGenerator class >> G2 [
	^ self new
		nodes: (1 to: 2);
		edgesArray: #()
]

{ #category : #'2 nodes' }
MalAtlasGraphGenerator class >> G3 [
	^ self new
		nodes: (1 to: 2);
		edgesArray: #(#(1 2))
]

{ #category : #'3 nodes' }
MalAtlasGraphGenerator class >> G4 [
	^ self new
		nodes: (1 to: 3);
		edgesArray: #()
]

{ #category : #'3 nodes' }
MalAtlasGraphGenerator class >> G5 [
	^ self new
		nodes: (1 to: 3);
		edgesArray: #(#(2 3))
]

{ #category : #'3 nodes' }
MalAtlasGraphGenerator class >> G6 [
	^ self new
		nodes: (1 to: 3);
		edgesArray: #(#(1 2) #(1 3))
]

{ #category : #'3 nodes' }
MalAtlasGraphGenerator class >> G7 [
	^ self new
		nodes: (1 to: 3);
		edgesArray: #(#(1 2) #(1 3) #(2 3))
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G8 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #()
]

{ #category : #'4 nodes' }
MalAtlasGraphGenerator class >> G9 [
	^ self new
		nodes: (1 to: 4);
		edgesArray: #(#(4 3))
]

{ #category : #configuration }
MalAtlasGraphGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #configuration }
MalAtlasGraphGenerator >> edgesArray: anArray [
	edgesArray := anArray
]

{ #category : #running }
MalAtlasGraphGenerator >> run [
	edgesArray
		do: [ :edge | 
			self
				addEdge:
					{edge first.
					edge second}
				from: #first
				to: #second ]
]
