"
A RTSetEdgeAlpha is an interaction raises the transparency of the incoming and outgoing edges for a given element when the mouse enter the element.

-=-=-=-=
	| v es |
	v := RTView new.
	es := RTEllipse new elementsOn: RTShape withAllSubclasses.
	v addAll: es.
	RTWeightedCircleLayout new
		initialRadius: 200;
		on: es.
	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfMethods
			min: 10
			max: 35
			using: #sqrt;
		normalizeColor: #numberOfLinesOfCode.
	RTEdgeBuilder new
		view: v;
		objects: RTShape withAllSubclasses;
		shape: (RTLine new color: Color blue);
		connectFrom: #yourself toAll: #dependentClasses.
	es @ RTPopup @ RTSetEdgeAlpha.
	^ v
-=-=-=-=
"
Class {
	#name : #RTSetEdgeAlpha,
	#superclass : #RTInteraction,
	#instVars : [
		'highAlpha',
		'lowAlpha',
		'evaluationBlock'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #initialization }
RTSetEdgeAlpha >> initialize [
	super initialize.
	highAlpha := 1.0.
	lowAlpha := 0.4.
	evaluationBlock := #connectedEdges
]

{ #category : #hooks }
RTSetEdgeAlpha >> initializeElement: element [
	self setLowAlphaFor: element.
	element
		when: TRMouseEnter
		do: [ :e | 
			self setHighAlphaFor: element.
			e signalUpdate ].
	element
		when: TRMouseLeave
		do: [ :e | 
			self setLowAlphaFor: element.
			e signalUpdate ]
]

{ #category : #'public - setting' }
RTSetEdgeAlpha >> onlyIncomingEdges [
	evaluationBlock := #incomingEdges
]

{ #category : #'public - setting' }
RTSetEdgeAlpha >> onlyOutgoingEdges [
	evaluationBlock := #outgoingEdges
]

{ #category : #initialization }
RTSetEdgeAlpha >> setAlpha: alpha for: element [
	(evaluationBlock rtValue: element)  do: [ :e | e trachelShape allColor: (e trachelShape color alpha: alpha) ]
]

{ #category : #utility }
RTSetEdgeAlpha >> setHighAlphaFor: element [
	self setAlpha: highAlpha for: element
]

{ #category : #utility }
RTSetEdgeAlpha >> setLowAlphaFor: element [
	self setAlpha: lowAlpha for: element
]
