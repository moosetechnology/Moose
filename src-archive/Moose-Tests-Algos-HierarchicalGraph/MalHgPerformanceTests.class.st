Class {
	#name : #MalHgPerformanceTests,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-HierarchicalGraph'
}

{ #category : #tests }
MalHgPerformanceTests >> testConstructingLargeHiGraphBottomUp [
	| hg rootNodes levels leafNodes profiler result |
	
	"(1 to: 1) do: [ :i |"

	rootNodes := OrderedCollection new.
	leafNodes := OrderedCollection new.
	levels := 11.
	
	rootNodes add: 'a'; add: 'b'; add: 'c'.
	rootNodes do: [ :model | MalHierarchicalGraphTests new recursiveStringFactory: model in: leafNodes to: levels ].
	
	profiler := TimeProfiler new.
	result := profiler runBlock: [	

		hg := MalHierarchicalGraph with: leafNodes.
	
		hg aggregation: [ :model |  
			(model size > 1) 
			ifTrue: [ model truncateTo: (model size - 1). ]
			ifFalse: [ nil ].
		].
	].

	"Transcript show: '#propEdges: ', hg edgesPropagated size asString, '; '.
	
	profiler rootTallyItems do: [ :t |
		Transcript show: t method selector, ' ', t tally asString, '; '.
	].

	Transcript show: 'total: ', profiler tally asString, ';'; cr."
	
	"profiler open.
	profiler showResult: result."
	"hg explore."
 	"]."
]

{ #category : #tests }
MalHgPerformanceTests >> testConstructingLargeHiGraphTopDown [
	| hg rootNodes profiler children levels result |

	rootNodes := OrderedCollection new.
	rootNodes add: 'a'; add: 'b'; add: 'c'.
	levels := 11.
	
	profiler := TimeProfiler new.
	result := profiler runBlock: [	
	
		hg := MalHierarchicalGraph with: rootNodes.
		hg topDown: [ :model |  
			(model size < levels) 
			ifTrue: [
				children := OrderedCollection new.
				children add: (model, 'a').
				children add: (model, 'b').
				children add: (model, 'c').
				children.
			]
		].
	].

	"profiler open.
	profiler showResult: result."
	"hg explore."
 	"]."
]
