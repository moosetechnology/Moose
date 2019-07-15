"
I am a variation of RTTreeMapBuilder in to explore in a better way any tree representation

"
Class {
	#name : #RTCircularTreeMapBuilder,
	#superclass : #RTAbstractTreeBuilder,
	#instVars : [
		'baseradius'
	],
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #accessing }
RTCircularTreeMapBuilder >> baseradius [
	^ baseradius
]

{ #category : #accessing }
RTCircularTreeMapBuilder >> baseradius: r [
	baseradius := r.
]

{ #category : #hooks }
RTCircularTreeMapBuilder >> createView [
	^ super createView @ RTDraggableView @ RTZoomableView.
]

{ #category : #'default-values' }
RTCircularTreeMapBuilder >> defaultBase [
	^ 250
]

{ #category : #layout }
RTCircularTreeMapBuilder >> expandCircle: e with: parent [

	e trachelShape position: parent x @ parent y.
	e trachelShape extent: (parent r*2) @ (parent r*2).
	
]

{ #category : #layout }
RTCircularTreeMapBuilder >> expandCircles: e parent: parent [
	"
	RTCircularTreeMapExample new example01
	"
	| cc |
	self expandCircle: e with: parent.
	(e attributes includesKey: self childrenKey) ifFalse: [ ^ self ].
	(e attributes at: self childrenKey) do: [ :child | 
		(child attributes includesKey: #circle) ifTrue: [ 
			cc := self relToAbsCircle: (child attributes at: #circle) parent: parent.
			self expandCircles: child parent: cc ] ].
]

{ #category : #private }
RTCircularTreeMapBuilder >> findBestGapIn: gaps children: children index: i 
	cbounding: cbounding bounds: bounds circles: circles
	 distance: distance closest: closest gap: gap ncircles: ncircles [
	| gapCircle cdistance |
	
	gaps do: [ :cgap | 
		gapCircle := cgap makeGapCircle: (self weight2rad: (self weightOf: (children at: i) )).
		cdistance := RTCircleTree distanceOf: cbounding and: gapCircle.
		cdistance < distance ifTrue: [ 
			cgap circles third isNotNil ifTrue: [ 
				(RTCircleTree doIntersect: cgap circles third with: gapCircle )
				ifTrue: [ cdistance := Float fmax. ] ]
			ifFalse: [ 
				[ :br | 
					((bounds findStart: gapCircle) to: ncircles) do: [ :ccircle |
						(RTCircleTree doIntersect: (circles at: ccircle) with: gapCircle)
						ifTrue: [ cdistance := Float fmax. br value ] ]
				] valueWithExit.  ] ].
		cdistance < distance ifTrue: [ 
			^ Array with: cdistance with: gapCircle with: cgap.  ].
	].
	^ Array with: distance with: closest with: gap
]

{ #category : #initialization }
RTCircularTreeMapBuilder >> initialize [
	super initialize.
	self shape circle
		fillColor: Color white;
		borderColor: Color gray.
	self interaction popup.
	baseradius := self defaultBase.
]

{ #category : #layout }
RTCircularTreeMapBuilder >> layout: e [
	
	| children |
	(e attributes includesKey: self childrenKey) ifFalse: [ ^ self ].
	
	children := e attributes at: self childrenKey.
	children isEmpty ifTrue: [ ^ self ].
	
	children do: [ :child | self layout: child ].
	self sortChildren: children.
	self layoutNodes: children
	
]

{ #category : #layout }
RTCircularTreeMapBuilder >> layoutElements [
	| virtualRoot |
	virtualRoot := (RTEllipse new borderWidth: 0.005) element.
	virtualRoot attributes at: self childrenKey put: rootNodes.
	self layout: virtualRoot.
	self expandCircles: virtualRoot parent: (RTCircleTree new r: self baseradius)
]

{ #category : #private }
RTCircularTreeMapBuilder >> layoutNodes: children [
	"
	RTCircularTreeMapExample new example01
	"
	| size circles bounds firstCircle cbounding circle distance   scale |
	size := children size.
	size > 100 ifTrue: [ size := 100 ].
	circles := OrderedCollection new: size.
	size = 0 ifTrue: [ ^ self ].
	
	bounds := RTBounds new max: 100.
	
	firstCircle := RTCircleTree new r: (self weight2rad: (self weightOf: children first)).
	circles add: firstCircle.
	cbounding := bounds push: firstCircle index: 1.
	size > 1 ifTrue: [ 
		circle  := RTCircleTree new r: (self weight2rad: (self weightOf: children second)) .
		circle translateBy: firstCircle center.
		circle translateBy: (RTVector new x: firstCircle r + circle r y: 0).
		circles add: circle.
		cbounding := bounds push: circle index: 2.
		size > 2 ifTrue: [ 
			| gaps closest gap ncircles |
			gaps := OrderedCollection new.
			gaps add: (RTGapTree new c1: firstCircle c2: circle).
			gaps add: (RTGapTree new c1: circle c2: firstCircle).
			ncircles := 2.
			closest := nil.
			gap := nil.
			(3 to: size) do: [ :i | | arr |
				distance := Float fmax.
				closest := nil.
				gap := nil.
				arr := self findBestGapIn: gaps children: children index: i 
					cbounding: cbounding bounds: bounds circles: circles 
					distance: distance closest: closest gap: gap ncircles: ncircles.
				
				distance := arr first.
				closest := arr second.
				gap := arr third.
				
				gaps remove: gap.
				gap addGapsTo: gaps closest: closest.
				circles add: closest.
				ncircles := ncircles + 1.
				(cbounding r < (distance + closest r)) 
					ifTrue: [ cbounding := bounds push: closest index: ncircles  ].
				
			] ] ].

	scale := 1/ cbounding r.
	(1 to: size) do: [ :i | | c |
		c := circles at: i.
		c translateBy: (cbounding center scaleBy: -1).
		c scaleFull: scale.
		(children at: i) attributes at: #circle put: c.
	 ].
	
	^ circles.
]

{ #category : #accessing }
RTCircularTreeMapBuilder >> popup [
	^ self interaction popup
]

{ #category : #layout }
RTCircularTreeMapBuilder >> relToAbsCircle: rel parent: parent [
	"
	RTCircularTreeMapExample new example02
	"
	| res |
	res := RTCircleTree new x: rel x y: rel y r: rel r.
	res scaleFull: parent r.
	res translateBy: (parent x @ parent y).
	^ res
]

{ #category : #hooks }
RTCircularTreeMapBuilder >> renderIn: aView [
	super renderIn: aView.
	self layoutElements.
]

{ #category : #layout }
RTCircularTreeMapBuilder >> sortChildren: children [
	children sort: [ :a :b | (self weightOf: a) > (self weightOf: b) ].
]

{ #category : #layout }
RTCircularTreeMapBuilder >> weight2rad: w [
	^ (w / Float pi) sqrt
]
