"
I'm building rectangular 2D grid with von Neumann or Moore neighborhood.
"
Class {
	#name : #MalGrid2DGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'width',
		'height',
		'neighborhood'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #accessing }
MalGrid2DGenerator >> buildMooreNeighborhood [
	| graph |
	graph := self nodes.
	2 to: width do: [ :i | 
		2 to: height do: [ :j | 
			self
				addEdge:
					{(graph at: (j - 1) * width + i) model.
					(graph at: (j - 1) * width + i - width) model}
				from: #first
				to: #second.
			self
				addEdge:
					{(graph at: (j - 1) * width + i) model.
					(graph at: (j - 1) * width + i - 1) model}
				from: #first
				to: #second.
			self
				addEdge:
					{(graph at: (j - 1) * width + i) model.
					(graph at: (j - 1) * width + i - width - 1) model}
				from: #first
				to: #second ] ].

	"Link upper nodes"
	1 to: width - 1 do: [ :i | 
		self
			addEdge:
				{(graph at: i) model.
				(graph at: i + 1) model}
			from: #first
			to: #second ].

	"Link left nodes"
	1 to: height - 1 do: [ :i | 
		self
			addEdge:
				{(graph at: (i - 1) * width + 1) model.
				(graph at: (i - 1) * width + 1 + width) model}
			from: #first
			to: #second ].
	1 to: width - 1 do: [ :i | 
		2 to: height do: [ :j | 
			self
				addEdge:
					{(graph at: (j - 1) * width + i) model.
					(graph at: (j - 1) * width + i - width + 1) model}
				from: #first
				to: #second ] ]
]

{ #category : #accessing }
MalGrid2DGenerator >> buildVonNeumannNeighorhood [
	| graph |
	graph := self nodes.
	2 to: width do: [ :i | 
		2 to: height do: [ :j | 
			self
				addEdge:
					{(graph at: (j - 1) * width + i) model.
					(graph at: (j - 1) * width + i - width) model}
				from: #first
				to: #second.
			self
				addEdge:
					{(graph at: (j - 1) * width + i) model.
					(graph at: (j - 1) * width + i - 1) model}
				from: #first
				to: #second ] ].

	"Link upper nodes"
	1 to: width - 1 do: [ :i | 
		self
			addEdge:
				{(graph at: i) model.
				(graph at: i + 1) model}
			from: #first
			to: #second ].

	"Link left nodes"
	1 to: height - 1 do: [ :i | 
		self
			addEdge:
				{(graph at: (i - 1) * width + 1) model.
				(graph at: (i - 1) * width + 1 + width) model}
			from: #first
			to: #second ]

	"Right left nodes"
	"1 to: height-1 do: [: i|
	self
					addEdge:
						{(graph at: (i-1)*width+1+width-1) model.
						(graph at: (i-1)*width+1+height+width-1) model}
					from: #first
					to: #second.
	 ].
"
]

{ #category : #configuration }
MalGrid2DGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #accessing }
MalGrid2DGenerator >> height: aNumber [
	height := aNumber
]

{ #category : #accessing }
MalGrid2DGenerator >> neighborhood: aSymbol [
	"#vonNeumann or #moore"

	neighborhood := aSymbol
]

{ #category : #running }
MalGrid2DGenerator >> run [
	self nodes: (1 to: height * width).
	neighborhood == #vonNeumann
		ifTrue: [ self buildVonNeumannNeighorhood ]
		ifFalse: [ self buildMooreNeighborhood ]
]

{ #category : #accessing }
MalGrid2DGenerator >> width: aNumber [
	width := aNumber
]
