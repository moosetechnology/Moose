Extension { #name : #MalGraphReducer }

{ #category : #'*Moose-RoassalPaintings-Visualization' }
MalGraphReducer class >> complexCycleGraph2 [
	| graph builder |
	builder := MalGraphStructure new
		nodeClass: MalGraphNode;
		edgeClass: MalGraphEdge;
		yourself.
	graph := MalGraphFixture complexCycleGraph2: builder.
	^ (MalGraphVisualization on: graph) open
]

{ #category : #'*Moose-RoassalPaintings-Visualization' }
MalGraphReducer class >> complexCycleGraph2Reduced [
	| graphReducer |
	graphReducer := MalGraphReducer new.
	MalGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.
	^ (MalGraphWithNextVisualization on: graphReducer) open
]

{ #category : #'*Moose-RoassalPaintings-Visualization' }
MalGraphReducer class >> exampleComplexCycleGraph2 [
	self complexCycleGraph2 setLabel: 'Original graph'.
	self complexCycleGraph2Reduced setLabel: 'Reduced graph'
]
