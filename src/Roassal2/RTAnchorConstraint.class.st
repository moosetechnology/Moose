"
I attach a RTElement to a RTEdge (works for both line and connection shapes). When the edge or it's extremities are moved, so is the anchor.

Furthermore I will try to move the Element in such a way that it doesn't overlap neither the edge, nor it's extremities, nor their other lines. I will not however prevent overlapping of another elements (e.g. another element or edge nearby).

!! Example

See RTConstraintExample>>exampleAnchorConstraint.

!! API

==#balance: aNumber==
Specify where the anchor should be positioned. x \in [0, 1] for relative positions (so 0.5 will be exactly middle, 1 at the end, etc.).
x > 1 or x < 0 for absolute positioning. E.g.: 10 - position the anchor 10 pixels from the beginning; -20 - 20 pixels from the end

==#minDistance: aNumber==
A minimum distance (in pixels) that should be maintained between the edge and the element



"
Class {
	#name : #RTAnchorConstraint,
	#superclass : #RTObject,
	#instVars : [
		'element',
		'edge',
		'minDistance',
		'balance',
		'anchorElement',
		'guideEdge',
		'anchorShape',
		'guideLine'
	],
	#category : #'Roassal2-Core'
}

{ #category : #building }
RTAnchorConstraint >> addAnchor [
	anchorElement := self anchorShape element.
	element view add: anchorElement.
	guideEdge := self guideLine edgeFrom: element to: anchorElement.
	element view add: guideEdge.
	edge trachelShape
		addCallback:
			(TRRemoveCallback
				block: [ element remove.
					anchorElement remove ])
]

{ #category : #building }
RTAnchorConstraint >> anchorSegment [
	^ self segments segmentWithPointFor: self balance
]

{ #category : #accessing }
RTAnchorConstraint >> anchorShape [
	^ anchorShape
]

{ #category : #accessing }
RTAnchorConstraint >> balance [
	^ balance
]

{ #category : #accessing }
RTAnchorConstraint >> balance: aNumber [
	balance := aNumber
]

{ #category : #building }
RTAnchorConstraint >> build [
	self addAnchor.
	edge from addCallback: (TRTranslationCallback block: [ self update ]).
	edge to addCallback: (TRTranslationCallback block: [ self update ]).
	"Do a symbol-based check, because DCRTConnection is not (yet?) in Roassal"
	edge shape className asSymbol = #DCRTConnection
		| (edge shape className asSymbol = #DCRTStyledConnection)
		ifTrue: [ edge when: #DCRTHandleMoved asClass do: [ self update ] ].
	element
		when: TRMouseDragStart
		do: [ 
			guideLine color: Color gray.
			guideEdge update.
			guideEdge view signalUpdate ].
	element
		when: TRMouseDragEnd
		do:
			[ 
			guideLine color: Color transparent.
			guideEdge update.
			guideEdge view signalUpdate ]
]

{ #category : #'as yet unclassified' }
RTAnchorConstraint >> computeExtraDistance [
	"Compute the extra distance required to move the element to not overlap the segment."

	| segment sideOfElement normals |
	segment := self anchorSegment first.
	sideOfElement := segment sideOfPoint: element position.
	normals := element encompassingRectangle corners
		select: [ :each | (segment sideOfPoint: each) ~= sideOfElement ]
		thenCollect: [ :each | each dist: (each nearestPointAlongLineFrom: segment from to: segment to) ].
	^ minDistance sign > 0
		ifTrue: [ normals max ]
		ifFalse: [ normals max negated ]
]

{ #category : #'as yet unclassified' }
RTAnchorConstraint >> connectionSegmentsFor: anEdge [
	^ (anEdge shape pathFor: anEdge)
		overlappingPairsCollect: [ :from :to | RTLineSegment from: from to: to ]
]

{ #category : #accessing }
RTAnchorConstraint >> edge [
	^ edge
]

{ #category : #accessing }
RTAnchorConstraint >> edge: anEdge [
	edge := anEdge
]

{ #category : #accessing }
RTAnchorConstraint >> element [
	^ element
]

{ #category : #accessing }
RTAnchorConstraint >> element: anElement [
	element := anElement
]

{ #category : #accessing }
RTAnchorConstraint >> guideLine [
	^ guideLine
]

{ #category : #initialization }
RTAnchorConstraint >> initialize [
	(anchorShape := RTEllipse new)
		size: 0;
		color: Color red.
	(guideLine := RTLine new) color: Color transparent
]

{ #category : #'as yet unclassified' }
RTAnchorConstraint >> lineSegmentFor: anEdge [
	^ anEdge lineSegments first
]

{ #category : #accessing }
RTAnchorConstraint >> minDistance [
	^ minDistance
]

{ #category : #accessing }
RTAnchorConstraint >> minDistance: anInteger [
	minDistance := anInteger
]

{ #category : #'as yet unclassified' }
RTAnchorConstraint >> moveAnchor [
	anchorElement translateTo: self anchorSegment last
]

{ #category : #'as yet unclassified' }
RTAnchorConstraint >> moveAwayFrom: aRectangle via: aVector [
	"There should be minDistance between the start and the element. Move it in the direction fo the current segment"

	| vector corners segment |
	"source and target of the edge on top of each other... ignore"
	aVector r = 0
		ifTrue: [ ^ self ].
	vector := aVector normalized * (aRectangle origin dist: aRectangle corner).
	corners := element encompassingRectangle corners
		select: [ :each | aRectangle containsPoint: each ].
	segment := (corners
		collect:
			[ :each | 
			| sg |
			sg := RTLineSegment from: each to: each + vector.
			RTLineSegment from: each to: (sg intersectRectangle: aRectangle) anyOne ])
		detectMax: #length.
	segment ifNotNil: [ element translateBy: segment vector ]
	"	segment
		ifNotNil:
			[ element view
				add:
					(RTSVGPath new
						path:
							'M' , segment from x asString , ',' , segment from y asString , 'L' , segment to x asString
								, ',' , segment to y asString;
						element) ]"
]

{ #category : #'as yet unclassified' }
RTAnchorConstraint >> moveAwayFromSegment: aSegment [
	(aSegment intersectRectangle: element encompassingRectangle)
		ifNotEmpty:
			[ :crossings | 
			element
				translateBy:
					aSegment vector normal
						* (minDistance + self computeExtraDistance) negated ]
]

{ #category : #'as yet unclassified' }
RTAnchorConstraint >> moveElement [
	| segment from to |
	segment := self anchorSegment first.
	element
		translateTo: anchorElement position + (segment vector normal * minDistance negated).
	self moveAwayFromSegment: segment.
	from := edge from encompassingRectangle expandBy: minDistance abs.
	to := edge to encompassingRectangle expandBy: minDistance abs.
	balance > 0 & (element encompassingRectangle intersects: from)
		ifTrue: [ self moveAwayFrom: from via: segment vector ].
	balance < 0 & (element encompassingRectangle intersects: to)
		ifTrue: [ self moveAwayFrom: to via: segment vector negated ]
]

{ #category : #accessing }
RTAnchorConstraint >> segments [
	(edge shape className = #DCRTConnection)
		ifTrue: [ ^ RTPolyLineSegment withAll: (self connectionSegmentsFor: edge) ].
	(edge shape isKindOf: RTBezierLine)
		ifTrue: [ ^ self notYetImplemented ].
	^ RTPolyLineSegment with: (self lineSegmentFor: edge)
]

{ #category : #updating }
RTAnchorConstraint >> update [
	self moveAnchor.
	self moveElement
]
