"
I'm building rectangular 2D grid with von Neumann or Moore neighborhood.
"
Class {
	#name : #MalGrid3DGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'width',
		'height',
		'length',
		'neighborhood'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #accessing }
MalGrid3DGenerator >> buildVonNeumannNeighorhood [
	| graph |
	graph := self nodes.
	1 to: length - 1 do: [ :i | 
		1 to: height - 1 do: [ :j | 
			1 to: width - 1 do: [ :k | 
				self
					addEdge:
						{(graph at: i + ((j - 1) * length) + ((k - 1) * length * height)) model.
						(graph at: i + ((j - 1) * length) + ((k - 1) * length * height) + 1) model}
					from: #first
					to: #second.
				self
					addEdge:
						{(graph at: i + ((j - 1) * length) + ((k - 1) * length * height)) model.
						(graph at: i + ((j - 1) * length) + ((k - 1) * length * height) + length) model}
					from: #first
					to: #second.
				self
					addEdge:
						{(graph at: i + ((j - 1) * length) + ((k - 1) * length * height)) model.
						(graph at: i + ((j - 1) * length) + (k * length * height)) model}
					from: #first
					to: #second ] ] ].

	"Right plane"
	1 to: height - 1 do: [ :j | 
		1 to: width - 1 do: [ :k | 
			self
				addEdge:
					{(graph at: length + ((j - 1) * length) + ((k - 1) * length * height)) model.
					(graph at: length + ((j - 1) * length) + ((k - 1) * length * height) + length) model}
				from: #first
				to: #second.
			self
				addEdge:
					{(graph at: length + ((j - 1) * length) + ((k - 1) * length * height)) model.
					(graph at: length + ((j - 1) * length) + (k * length * height)) model}
				from: #first
				to: #second ] ].

	"Top plan"
	1 to: length - 1 do: [ :i | 
		1 to: height - 1 do: [ :j | 
			self
				addEdge:
					{(graph at: i + ((j - 1) * length) + ((width - 1) * length * height)) model.
					(graph at: i + ((j - 1) * length) + ((width - 1) * length * height) + 1) model}
				from: #first
				to: #second.
			self
				addEdge:
					{(graph at: i + ((j - 1) * length) + ((width - 1) * length * height)) model.
					(graph at: i + ((j - 1) * length) + ((width - 1) * length * height) + length) model}
				from: #first
				to: #second ] ].
	"Back Plane"
	1 to: length - 1 do: [ :i | 
		1 to: width - 1 do: [ :k | 
			self
				addEdge:
					{(graph at: i + ((height - 1) * length) + ((k - 1) * length * height)) model.
					(graph at: i + ((height - 1) * length) + ((k - 1) * length * height) + 1) model}
				from: #first
				to: #second.
			self
				addEdge:
					{(graph at: i + ((height - 1) * length) + ((k - 1) * length * height)) model.
					(graph at: i + ((height - 1) * length) + (k * length * height)) model}
				from: #first
				to: #second ] ].

	"Rigth Edge"
	1 to: width - 1 do: [ :k | 
		self
			addEdge:
				{(graph at: length + ((height - 1) * length) + ((k - 1) * length * height)) model.
				(graph at: length + ((height - 1) * length) + (k * length * height)) model}
			from: #first
			to: #second ].
	"Top Edge"
	1 to: height - 1 do: [ :j | 
		self
			addEdge:
				{(graph at: length + ((j - 1) * length) + ((width - 1) * length * height)) model.
				(graph at: length + ((j - 1) * length) + ((width - 1) * length * height) + length) model}
			from: #first
			to: #second ].

	"Top Back Edge"
	1 to: length - 1 do: [ :i | 
		self
			addEdge:
				{(graph at: i + ((height - 1) * length) + ((width - 1) * length * height)) model.
				(graph at: i + ((height - 1) * length) + ((width - 1) * length * height) + 1) model}
			from: #first
			to: #second ]
]

{ #category : #configuration }
MalGrid3DGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #accessing }
MalGrid3DGenerator >> height: aNumber [
	height := aNumber
]

{ #category : #accessing }
MalGrid3DGenerator >> length: aNumber [
	length := aNumber
]

{ #category : #accessing }
MalGrid3DGenerator >> neighborhood: aSymbol [
	"#vonNeumann or #moore"

	neighborhood := aSymbol
]

{ #category : #running }
MalGrid3DGenerator >> run [
	self nodes: (1 to: length * height * width).
	neighborhood == #vonNeumann
		ifTrue: [ self buildVonNeumannNeighorhood ]
		ifFalse: [ "self buildMooreNeighborhood" "Not yet implemented" ]
]

{ #category : #accessing }
MalGrid3DGenerator >> width: aNumber [
	width := aNumber
]
