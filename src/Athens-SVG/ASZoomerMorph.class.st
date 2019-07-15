Class {
	#name : #ASZoomerMorph,
	#superclass : #Morph,
	#instVars : [
		'basicExtent',
		'maxZoom',
		'currentAnimation',
		'currentZoom',
		'targetZoom',
		'animStartZoom',
		'svg',
		'surface',
		'svgExtent',
		'svgZoom',
		'animCenter'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASZoomerMorph >> animateZoomTo: zoomLevel [


	targetZoom := zoomLevel.
	animStartZoom := currentZoom.

	currentAnimation := ASAnimation new subject: self.
	currentAnimation stopCondition: [:anim | anim duration >= self maxAnimationDuration ].
	currentAnimation stepAction:  [:anim | | duration |
		duration := (anim duration min: self maxAnimationDuration) / self maxAnimationDuration asFloat.
		
		self setZoom:  animStartZoom * (1-duration) + (targetZoom * duration).

		 ].
	currentAnimation finishAction: [:anim |
		self stopStepping.
		self setZoom: targetZoom.
		currentAnimation := nil.
		].
	
	currentAnimation start.
	self startStepping
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> drawDropShadowOn: aCanvas [

]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> drawOn: aCanvas [
	
	svg ifNotNil: [
		
		surface drawDuring: [:canvas |  
		
			surface clear.
			canvas pathTransform restoreAfter: [
				canvas pathTransform scaleBy: (currentZoom * svgZoom) asFloat.
				svg renderOn: canvas.
			]
		 ].
		aCanvas translucentImage: surface asForm at: self innerBounds origin
		
	] ifNil: [
		super drawOn: aCanvas.
	]
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> extent: pos [

	super extent: pos.
	
	animCenter := self bounds center.
	
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> handlesDropShadowInHand [
	"Answer whether the receiver will handle drop shadow drawing when picked up in the hand."

	^ true
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> handlesMouseOver: evt [
	^ true
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> initialize [ 


	super initialize.
	
	currentZoom := 1.
	basicExtent  := self extent.
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> justDroppedInto: aMorph event: anEvent [

	super justDroppedInto: aMorph event: anEvent.
	
	animCenter := self bounds center.
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> maxAnimationDuration [
	^ 100
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> maxZoom [
	
	^ maxZoom ifNil: [ maxZoom := 2 ]
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> maxZoom: aValue [

	maxZoom := aValue max: 1

]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> mouseEnter: evt [
	self comeToFront.
	self animateZoomTo: self maxZoom
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> mouseLeave: evt [
	self animateZoomTo: 1
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> position: pos [

	super position: pos.
	
	animCenter := self bounds center.
	
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> screenDPI [ 
	^ 96 "just a guess "
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> setZoom: aZoom [
	|  newExtent oldCenter |
	currentZoom := aZoom.
	newExtent := basicExtent * aZoom.
	
	oldCenter := animCenter.
	self bounds: (animCenter - (newExtent /2) extent: newExtent).
	animCenter := oldCenter.
	
	self changed
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> step [

	currentAnimation ifNotNil: [
		currentAnimation step
		]
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> stepTime [
	^ 20
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> svg: anSVG [

	^ self svg: anSVG zoom: 1
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> svg: anSVG zoom: anSvgZoom [
	| w h |
	
	svg := anSVG.
	svg isString ifTrue: [ svg :=  AthensSVGConverter fromFile: svg ].
	svgExtent := self extent.
	
	svg width ifNotNil: [
		w := svg width valueForDPI: self screenDPI.
		h := svg height valueForDPI: self screenDPI.
		svgExtent := (w@h) * anSvgZoom + (2@2).
		svgZoom := anSvgZoom.
	] ifNil: [
		svgExtent := self extent.
		svgZoom := 1.
	].

	surface := AthensCairoSurface extent: (svgExtent * self maxZoom + (1@1)) asIntegerPoint.
	basicExtent := svgExtent.
	self extent: svgExtent.
	currentZoom := 1.	
	self changed
]

{ #category : #'as yet unclassified' }
ASZoomerMorph >> wantsToBeDroppedInto: aMorph [

	^ aMorph isWorldMorph
]
