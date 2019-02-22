"
I am class to handle a lot of elements and draw

I am still growing, if you find a best answer to cache elements, please let me to to akevalion@gmail.co
"
Class {
	#name : #RTCache,
	#superclass : #RTObject,
	#instVars : [
		'canvas',
		'trachelShapes',
		'shapeBeingPointed'
	],
	#category : #'Roassal2-Cachetor'
}

{ #category : #private }
RTCache >> addEvents: bitmap [
	bitmap when: TRMouseMove do: [ :evt| self processMouseMove: evt. ].
	bitmap when: TRMouseDragging do: [ :evt | self processMouseDrag: evt ].
	bitmap when: TRMouseClick do: [ :evt | self processMouseClick: evt ].
]

{ #category : #private }
RTCache >> cacheElements: someElements [
	^ self cacheElements: someElements edges: #().
	
]

{ #category : #private }
RTCache >> cacheElements: someElements edges: someEdges [
	"This method is assuming all the elements belong to the same view"
	| view newElement elements edges |
	
	elements := someElements asGroup.
	edges := someEdges asGroup.
	view := someElements anyOne view.
	canvas := view canvas.
	trachelShapes := canvas shapes.
	newElement := (RTBitmap new form: (self getFormElements: elements, edges)) element.
	self addEvents: newElement.
	newElement translateTo: canvas encompassingRectangle center.
	view removeAllElements.
	view add: newElement.
	^ newElement.
]

{ #category : #public }
RTCache >> cacheView: aView [
	"Public method"
	self cacheElements: aView elements edges: aView edges
]

{ #category : #private }
RTCache >> eventOfClass: anEventClass actionClass: anActionClass from: event [
	| relativePosition trEvent shape |
	relativePosition := canvas camera fromSpaceToPixel: event position.
	shape := self shapeWithAction: anActionClass forPositionInPixels: relativePosition.

	trEvent := anEventClass fromEvent: event.
	trEvent
		morph: self;
		canvas: canvas;
		shape: shape;
		position: relativePosition.
	^ trEvent
]

{ #category : #private }
RTCache >> eventOfClass: anEventClass from: aMorphicEvent [
	^ self eventOfClass: anEventClass actionClass: anEventClass from: aMorphicEvent
]

{ #category : #private }
RTCache >> getFormElements: someElements [
	"Return a form contains the graphical representation of the elements"
	
	| extent surface formCanvas |
	extent := someElements extent asIntegerPoint.
	surface := TRPlatform current surfaceClass extent: extent.
	formCanvas := TRPlatform current formCanvasClass extent: extent.
	formCanvas fillRectangle: ((0 @ 0) extent: extent) color: Color transparent.
	surface
		drawDuring: [ :cs | 
			"Probably not necessary since we have just created a surface"
			cs pathTransform
				translateBy: (someElements encompassingRectangle topLeft) negated asFloatPoint
				"translateBy: (someElements position asFloatPoint) negated"
				"scaleBy: self cameraScale;
				translateBy: self cameraPositionNegated".
			surface clear.
			someElements do: [ :element | element trachelShape drawOn: cs ].
			cs pathTransform loadIdentity scaleBy: 1.001. ].
	[formCanvas
	 	image: surface asForm
		at: 0 @ 0
		sourceRect: (0 @ 0 extent: surface extent)
		rule: 34] on: Exception do: [ :ex | ].
	^ formCanvas form
]

{ #category : #private }
RTCache >> processMouseClick: evt [
]

{ #category : #private }
RTCache >> processMouseDrag: evt [
	| shape relativePosition |
	relativePosition := canvas camera fromSpaceToPixel: evt position.
	shape := self shapeWithAction: evt class forPositionInPixels: relativePosition.
	evt shape: shape.
	evt shape announce: evt.
	evt position: relativePosition.
]

{ #category : #private }
RTCache >> processMouseMove: evt [
	| currentElement trEvent |
	shapeBeingPointed 
		ifNil: [ 
			trEvent := self eventOfClass: TRMouseEnter from: evt.
			shapeBeingPointed := trEvent shape.
			trEvent shape announce: trEvent.
			^ self ].
	currentElement := self shapeForEvent: evt.
	currentElement == shapeBeingPointed
		ifTrue: [ ^ self ].
	trEvent := self eventOfClass: TRMouseLeave from: evt.
	trEvent shape: shapeBeingPointed.
	shapeBeingPointed announce: trEvent.
	shapeBeingPointed := currentElement.
	trEvent := self eventOfClass: TRMouseEnter from: evt.
	trEvent shape announce: trEvent.
]

{ #category : #private }
RTCache >> shapeForEvent: evt [
	^ self shapeWithActionForPositionInPixels: (canvas camera fromSpaceToPixel: evt position).
]

{ #category : #private }
RTCache >> shapeWithAction: eventClass forPositionInPixels: position [
	| pos |
	pos := canvas camera fromPixelToSpace: position.
	trachelShapes reverseDo: [ :s| 
		((s includesPoint: pos) 
			and: [ s announcer handleEventClass: eventClass ]) ifTrue: [ ^ s ] ].
	^ canvas
]

{ #category : #private }
RTCache >> shapeWithActionForPositionInPixels: position [
	| pos |
	pos := canvas camera fromPixelToSpace: position.
	trachelShapes reverseDo: [ :s| 
		((s includesPoint: pos) 
			and: [ s hasEventCallback ]) ifTrue: [ ^ s ] ].
	^ canvas
]
