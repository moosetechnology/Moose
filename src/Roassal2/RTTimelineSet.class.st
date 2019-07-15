"
RTTimelineSet new a set of events for the timeline. 
It takes a list of objects, lineIdentifier, start and end.

Consider the following example:
[ [ [ 
	data := #(#(c1 0 5) #(c1 6 8) #(c2 0 5) #(c2 8 10) #(c3 0 10) #(c4 5 10) #(c5 5 8)).

	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: data.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 
	b
]]]
"
Class {
	#name : #RTTimelineSet,
	#superclass : #RTObject,
	#instVars : [
		'shapeBuilder',
		'interactionBuilder',
		'start',
		'end',
		'lineIdentifier',
		'objects',
		'globalMin',
		'globalMax',
		'elements'
	],
	#category : #'Roassal2-Builder-Timeline'
}

{ #category : #configuration }
RTTimelineSet >> defaultBarColor [
	^ Color blue alpha: 0.4
]

{ #category : #accessing }
RTTimelineSet >> elements [
	^ elements
]

{ #category : #accessing }
RTTimelineSet >> end [
	^ end
]

{ #category : #accessing }
RTTimelineSet >> end: symbolOrBlockOrValue [
	"The argument will be evaluated on each element of objects."
	end := symbolOrBlockOrValue
]

{ #category : #configuration }
RTTimelineSet >> gapBetweenTimeLines [
	^ 3
]

{ #category : #accessing }
RTTimelineSet >> globalMax [
	^ globalMax
]

{ #category : #accessing }
RTTimelineSet >> globalMax: anObject [
	globalMax := anObject
]

{ #category : #accessing }
RTTimelineSet >> globalMin [
	^ globalMin
]

{ #category : #accessing }
RTTimelineSet >> globalMin: anObject [
	globalMin := anObject
]

{ #category : #initialization }
RTTimelineSet >> initialize [
	super initialize.
	self initializeShapeBuilder.
	self initializeInteractionBuilder.
	lineIdentifier := #yourself.
	start := #yourself.
	end := #yourself.
	objects := #()
]

{ #category : #initialization }
RTTimelineSet >> initializeInteractionBuilder [
	interactionBuilder := RTInteractionBuilder new popup; yourself
]

{ #category : #initialization }
RTTimelineSet >> initializeShapeBuilder [
	shapeBuilder := RTShapeBuilder new.
	shapeBuilder rectangle color: self defaultBarColor
]

{ #category : #accessing }
RTTimelineSet >> interaction [
	^ interactionBuilder 
]

{ #category : #accessing }
RTTimelineSet >> lineIdentifier [
	^ lineIdentifier
]

{ #category : #accessing }
RTTimelineSet >> lineIdentifier: symbolOrBlockOrValue [
	"The argument will be evaluated on each element of objects."
	lineIdentifier := symbolOrBlockOrValue
]

{ #category : #'accessing - computed' }
RTTimelineSet >> lineIdentifiers [
	^ objects collect: [ :o | lineIdentifier rtValue: o ]
]

{ #category : #'accessing - computed' }
RTTimelineSet >> localMax [
	^ (objects collect: [ :o | end rtValue: o ]) max
]

{ #category : #'accessing - computed' }
RTTimelineSet >> localMin [
	^ (objects collect: [ :o | start rtValue: o ]) min
]

{ #category : #configuration }
RTTimelineSet >> minimumEventWidth [
	"An event cannot be less than 2 pixels-wide"
	^ 2
]

{ #category : #'accessing - computed' }
RTTimelineSet >> numberOfIdentifier [
	^ self identifiers size
]

{ #category : #'accessing - computed' }
RTTimelineSet >> numberOfLines [
	^ self lineIdentifiers size
]

{ #category : #'accessing - computed' }
RTTimelineSet >> numberOfObjects [
	^ objects size
]

{ #category : #accessing }
RTTimelineSet >> objects [
	^ objects
]

{ #category : #accessing }
RTTimelineSet >> objects: anObject [
	objects := anObject
]

{ #category : #rendering }
RTTimelineSet >> renderIn: view using: timelineBuilder [

	| translator |
	self setRenderedHeight: timelineBuilder.
		
	elements := shapeBuilder elementsOn: objects.
	interactionBuilder setUpElements: elements.
	view addAll: elements.
	
	"We set the width of the elements"
	RTMetricNormalizer new
		elements: elements;
		normalizeWidth: [ :anObject | (end rtValue: anObject) - (start rtValue: anObject) ]
			min: self minimumEventWidth
			max: timelineBuilder extent x
			minValue: 0
			maxValue: globalMax.

	"For the location"
	translator := RTDirectLayoutTranslator new.
	elements do: [ :e | 
		| nx ny |
		nx := self setRenderedXFor: e builder: timelineBuilder.
		ny := self setRenderedYFor: e builder: timelineBuilder.
		translator translateTopLeftOf: e to: nx @ ny ].

]

{ #category : #rendering }
RTTimelineSet >> setRenderedHeight: timelineBuilder [
	shapeBuilder
		height:
			[ :obj | 
			timelineBuilder extent y / timelineBuilder numberOfLines
				- self gapBetweenTimeLines ]
]

{ #category : #rendering }
RTTimelineSet >> setRenderedXFor: element builder: timelineBuilder [
	^ (start rtValue: element model) / globalMax * timelineBuilder extent x
]

{ #category : #rendering }
RTTimelineSet >> setRenderedYFor: element builder: timelineBuilder [
	| indexY |
	indexY := timelineBuilder
		indexOfLineIdentifier: (lineIdentifier rtValue: element model).
	^ (timelineBuilder getPixelPositionOf: 0 @ indexY) y
]

{ #category : #accessing }
RTTimelineSet >> shape [
	^ shapeBuilder
]

{ #category : #accessing }
RTTimelineSet >> start [
	^ start
]

{ #category : #accessing }
RTTimelineSet >> start: symbolOrBlockOrValue [
	"The argument will be evaluated on each element of objects."
	start := symbolOrBlockOrValue
]
