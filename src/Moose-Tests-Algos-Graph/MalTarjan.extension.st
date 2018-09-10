Extension { #name : #MalTarjan }

{ #category : #'*Moose-Tests-Algos-Graph' }
MalTarjan class >> mondrianSample [
	"
	MalTarjan mondrianSample
	"

	| nodes edges g tarjan colorDic i color view b window |
	(Smalltalk globals includesKey: #MOViewRenderer)
		ifFalse: [ ^ self ].
		
	b := MalGraphStructure new nodeClass: MalGraphNode; edgeClass: MalGraphEdge.
	MalGraphFixture complexCycleGraph: b.
	nodes := b nodes.
	edges := b edges.

	view := (Smalltalk globals at: #MOViewRenderer) new.
	view interaction item: 'show me the cycle' action: [:modelNode|
		g := (view nodeForDomainValue: modelNode).
		tarjan := MalTarjan new.
 		tarjan nodes: g nodes.
		tarjan edges: g edges from: #source to: #target.
		tarjan run.
		colorDic := IdentityDictionary new.
		i := 1.
		tarjan nodes do: [ :n | 
			color := Color distinctTenStrongColors at: i.
			i := i + 1.
			colorDic at: n model ifAbsentPut: color.
			n cycleNodes do: [:cn| colorDic at: cn model ifAbsentPut: color ] ].
		g nodes do: [:e | e copyShapeAndDo: [:p | p fillColor: (colorDic at: e)]].

		view root resetMetricCachesRecursively.
		view root resetFormCacheRecursively.
		view updateWindow.
		].

	view nodes: (1 to: 5) forEach: [:each |
		view shape rectangle size: 20.
		view nodes: nodes.
		view shape arrowedLine.
		view edges: edges from: #from to: #to fromGlobal: false toGlobal: false.
		view circleLayout.
	].
	
	window := view open.
	^ {window . view}
]
