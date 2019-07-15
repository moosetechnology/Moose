Class {
	#name : #RTSugiyamaLayoutTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Layouts-Tests'
}

{ #category : #'as yet unclassified' }
RTSugiyamaLayoutTest >> testBasic [

	| v es |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 10).
	v addAll: es.
	RTEdgeBuilder new
		view: v;
		connectFrom: [ :value | value // 2 ].
	RTSugiyamaLayout on: v elements.
	
]
