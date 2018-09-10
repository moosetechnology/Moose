Class {
	#name : #TRCanvas,
	#superclass : #TRCallableObject,
	#instVars : [
		'canvas',
		'shapes',
		'fixedShapes',
		'extent',
		'animations',
		'morph',
		'camera',
		'announcer',
		'color',
		'session',
		'eventOverseer',
		'theme',
		'clearBackground'
	],
	#category : #'Trachel-Core'
}

{ #category : #visitor }
TRCanvas >> accept: aVisitor [
	aVisitor visitCanvas: self
]

{ #category : #animations }
TRCanvas >> addAnimation: anAnimation [
	animations add: anAnimation.
	anAnimation addedIn: self.
	anAnimation start.
	self signalUpdate
]

{ #category : #'adding removing shapes' }
TRCanvas >> addFixedShape: shape [
	fixedShapes add: shape.
	shape canvas: self
]

{ #category : #menu }
TRCanvas >> addMenu: aTitle callback: aBlock [
	| lbl index |
	index := fixedShapes inject: 0 into: [ :s :e | s max: (e encompassingRectangle topRight x + 10) ].
	lbl := TRLabelShape new text: aTitle; translateLeftTo: index @ 20.
	lbl color: Color black.
	lbl when: TRMouseClick do: [ :event | aBlock value ].
	lbl when: TRMouseEnter do: [ :event | lbl color: Color blue. self signalUpdate ].
	lbl when: TRMouseLeave do: [ :event | lbl color: Color black. self signalUpdate ].
	self addFixedShape: lbl
]

{ #category : #menu }
TRCanvas >> addMenuAsSVG: aTitle callback: aBlock [
	^ self addMenuAsSVG: aTitle scale: 1.0 callback: aBlock
]

{ #category : #menu }
TRCanvas >> addMenuAsSVG: aTitle scale: scaleAsFloat callback: aBlock [
	| icon index |
	index := fixedShapes inject: 0 into: [ :s :e | s max: (e encompassingRectangle topRight x + 10) ].
	icon := TRSVGPath new path: aTitle.
	icon scaleBy: scaleAsFloat.
	icon color: Color black.
	icon when: TRMouseClick do: [ :event | aBlock value ].
	icon when: TRMouseEnter do: [ :event | icon color: Color blue. self signalUpdate ].
	icon when: TRMouseLeave do: [ :event | icon color: Color black. self signalUpdate ].
	self addFixedShape: icon
]

{ #category : #'adding removing shapes' }
TRCanvas >> addShape: shape [
	shape addedIn: self.
	shape triggerCallbacksForAddition
]

{ #category : #'adding removing shapes' }
TRCanvas >> addShape: shape atIndex: index [
	shape addedIn: self atIndex: index.
	shape triggerCallbacksForAddition
]

{ #category : #accessing }
TRCanvas >> allShapesWithAction: eventClass forPositionInPixels: position [
	"position is in pixel, it corresponds to the physical location in the window.
	e.g., 0 @ 0 is top left of the window"

	| pos shapesWithAction |
	shapesWithAction := OrderedCollection new.
	fixedShapes
		reverseDo: [ :s | 
			((s includesPoint: position) and: [ s announcer handleEventClass: eventClass ])
				ifTrue: [ shapesWithAction add: s ] ].
	pos := self camera fromPixelToSpace: position.
	shapes
		reverseDo: [ :s | 
			((s includesPoint: pos) and: [ s announcer handleEventClass: eventClass ])
				ifTrue: [ shapesWithAction add: s ] ].
	(self announcer handleEventClass: eventClass)
		ifTrue: [ shapesWithAction add: self ].
	^ shapesWithAction
]

{ #category : #animations }
TRCanvas >> animations [
	^ animations
]

{ #category : #animations }
TRCanvas >> animationsRemoveAll: someAnimations [
	animations := animations copyWithoutAll: someAnimations
]

{ #category : #events }
TRCanvas >> announce: anEvent [
	self announcer announce: anEvent
]

{ #category : #events }
TRCanvas >> announcer [
	announcer isNil ifTrue: [ announcer := Announcer new ].
	^ announcer
]

{ #category : #events }
TRCanvas >> announcer: anAnnouncer [
	announcer := anAnnouncer
]

{ #category : #accessing }
TRCanvas >> athensCanvas [
	^ self canvas
]

{ #category : #'adding removing shapes' }
TRCanvas >> buildArcAlphaAngle: stAngle betaAngle: ndAngle innerRadius: iR externalRadius: eR [
	| shape |
	shape := TRArcShape new.
	shape alphaAngle: stAngle betaAngle: ndAngle innerRadius: iR externalRadius: eR.
	self addShape: shape.
	^ shape
]

{ #category : #'adding removing shapes' }
TRCanvas >> buildCircleFrom: aPoint to: anotherPoint color: aColor [
	| shape |
	shape := TREllipseShape new.
	shape from: aPoint to: anotherPoint color: aColor.
	self addShape: shape.
	^ shape
]

{ #category : #'adding removing shapes' }
TRCanvas >> buildLineFrom: aPoint to: anotherPoint color: aColor [
	|  shape |
	shape := TRLineShape new.
	shape from: aPoint to: anotherPoint color: aColor.
	self addShape: shape.
	^ shape
]

{ #category : #'instance creation' }
TRCanvas >> buildMorph [
	morph := self morphClass new
		canvas: self;
		extent: self canvas extent.
	^ morph
]

{ #category : #'adding removing shapes' }
TRCanvas >> buildRectangle: aRectangle color: aColor [
	| shape |
	shape := TRBoxShape new.
	shape fromRectangle: aRectangle color: aColor.
	self addShape: shape.
	^ shape
]

{ #category : #accessing }
TRCanvas >> camera [
	^ camera
]

{ #category : #accessing }
TRCanvas >> camera: aCamera [
	camera := aCamera 
]

{ #category : #events }
TRCanvas >> canvas [
	session == TRPlatform current session
		ifFalse: [ 
			canvas := TRPlatform current surfaceClass extent: extent asIntegerPoint.
			session := TRPlatform current session ].
	^ canvas
]

{ #category : #actions }
TRCanvas >> clean [
	self shapes copy do: #remove.
	self fixedShapes copy do: #remove
]

{ #category : #accessing }
TRCanvas >> clearBackground [
	^ clearBackground
]

{ #category : #accessing }
TRCanvas >> clearBackground: aBool [
	clearBackground := aBool
]

{ #category : #accessing }
TRCanvas >> color [
	"Return the color used as background" 
	^ color
]

{ #category : #accessing }
TRCanvas >> color: aColor [
	"Set the color used as background"
	color := aColor.
	self signalUpdate
]

{ #category : #accessing }
TRCanvas >> encompassingRectangle [
	"Return the encompassing rectangle of all the elements contained in the canvas"
		
	| r e |
	r := self camera encompassingRectangleOf: self shapes.
	e := r extent max: 1 @ 1.
	^ r topLeft extent: e
]

{ #category : #accessing }
TRCanvas >> eventOverseer [
	"Return the event overseer, if defined. The overseer is an object that gets notificed by all events of the morph"
	^ eventOverseer
]

{ #category : #events }
TRCanvas >> eventOverseer: anEventOverseer [
	"This method register anEventOverseer as the event overseer in the TRMorph. At each event fired by, the event overseer will get notified"
	eventOverseer := anEventOverseer
]

{ #category : #accessing }
TRCanvas >> extent [
	"size of the canvas"
	^ extent
]

{ #category : #accessing }
TRCanvas >> extent: newExtentAsPoint [
	"Set of the size of the canvas. Useful, for example, when the window is resized"
	| evt |
	evt := TRResizeCanvasEvent new.
	evt oldExtent: extent.
	evt newExtent: newExtentAsPoint.
	extent := newExtentAsPoint.
	self announce: evt
]

{ #category : #actions }
TRCanvas >> firstElementOf: aCollection [ 
	"Return the first element of aCollection that will be displayed. This method assume that all elements contained in aCollection belong to shapes. It also assumes that aCollection is not empty"
	| lastElement lastIndex |
	lastElement := aCollection first.
	lastIndex := shapes indexOf: lastElement.
	aCollection do: [ :e |
		| v |
		v := shapes indexOf: e.
		(v < lastIndex) ifTrue: [ 
			lastElement := e.
			lastIndex := v ]
		 ].
	^ lastElement
]

{ #category : #accessing }
TRCanvas >> fixedShapes [
	^ fixedShapes
]

{ #category : #actions }
TRCanvas >> focusOnCenterScaled [
	^ self camera focusOnCenterScaled: self extent * 0.9
]

{ #category : #animations }
TRCanvas >> hasAnimation [
	"True if at least one animation is running"
	^ animations notEmpty
]

{ #category : #animations }
TRCanvas >> hasAnimation: anAnimation [
	"True if anAnimation is running"
	^ animations includes: anAnimation
]

{ #category : #theme }
TRCanvas >> hasTheme [
	"Return whether the canvas has a theme set by the user. If no theme is set, then
	 a theme will be infered by (TRMorph or TRVisual)"
	^ theme notNil 
]

{ #category : #initialization }
TRCanvas >> initialize [
	super initialize.
	extent := 500 @ 500.
	canvas := TRPlatform current surfaceClass extent: extent.
	shapes := OrderedCollection new.
	fixedShapes := OrderedCollection new.
	animations := OrderedCollection new.
	camera := TRCamera forCanvas: self.
	theme := TRTheme infer.
	color := theme trachelCanvasColor.
	session := TRPlatform current session.
	clearBackground := true.
	"No event overseer at the creation"
	eventOverseer := nil
]

{ #category : #testing }
TRCanvas >> isFixedShape: aShape [
	^ fixedShapes includes: aShape
]

{ #category : #testing }
TRCanvas >> isMovableShape: aShape [
	^ shapes includes: aShape
]

{ #category : #accessing }
TRCanvas >> morph [
	^ morph
]

{ #category : #'instance creation' }
TRCanvas >> morphClass [
	^ TRPlatform current trMorphClass
]

{ #category : #events }
TRCanvas >> notifyEventOverseerWith: anEvent [
	eventOverseer ifNil: [ ^ self ].
	eventOverseer firedEvent: anEvent
]

{ #category : #animations }
TRCanvas >> numberOfAnimations [
	"Return the number of animations contained in the canvas"
	^ animations size
]

{ #category : #accessing }
TRCanvas >> numberOfFixedShapes [
	"Return the number of displayed shapes"
	^ fixedShapes size
]

{ #category : #accessing }
TRCanvas >> numberOfShapes [
	"Return the number of displayed nonfixed shapes"
	^ shapes size 
]

{ #category : #'instance creation' }
TRCanvas >> open [
	^ self openInWindowSized: 500 @ 500
]

{ #category : #'instance creation' }
TRCanvas >> openInWindowSized: anExtentAsPoint [
	| window |
	self buildMorph.
	window := morph openInWindow.
	window extent: anExtentAsPoint.
	^ window
]

{ #category : #'instance creation' }
TRCanvas >> openInWindowSized: anExtentAsPoint titled: aTitle [
	| window |
	window := self openInWindowSized: anExtentAsPoint.
	window setLabel: aTitle.
	^ window
]

{ #category : #'instance creation' }
TRCanvas >> openTitled: aTitle [
	^ self openInWindowSized: 500 @ 500 titled: aTitle
]

{ #category : #animations }
TRCanvas >> playAnimations [
	| shouldClean |
	shouldClean := false.
	animations do: [ :animation | 
		animation refresh. 
		animation hasCompleted ifTrue: [ shouldClean := true ] ].
	
	shouldClean ifTrue: [ 
		animations := animations reject: [ :animation | animation hasCompleted ] ].
]

{ #category : #private }
TRCanvas >> privateAdd: shape [
	shapes add: shape
]

{ #category : #private }
TRCanvas >> privateAdd: shape atIndex: index [
	shapes add: shape beforeIndex: index
]

{ #category : #private }
TRCanvas >> privateIndexInCanvasOf: aShape [
	^ shapes indexOf: aShape
]

{ #category : #private }
TRCanvas >> privateShapes [
	^ shapes
]

{ #category : #private }
TRCanvas >> privateShapes: aCollection [
	shapes	 := aCollection
]

{ #category : #actions }
TRCanvas >> push: aShape behind: anotherShape [
	| index |
	aShape remove.
	index := anotherShape indexInCanvas.
	aShape addedIn: self atIndex: index.
	aShape canvas: self 
]

{ #category : #actions }
TRCanvas >> push: aShape behindAll: aCollection [ 
	"Move the first argument, which is supposely be contained in the shapes variable, before all elements contained in aCollection"
	| firstElement |
	firstElement := self firstElementOf: aCollection.
	self push: aShape behind: firstElement
]

{ #category : #actions }
TRCanvas >> pushAll: elements1 behindAll: elements2 [ 
	"Move all elements in elements1, which are supposely contained in the shapes variable, before all elements contained in elements2"
	| firstElement |
	firstElement := self firstElementOf: elements2.
	elements1 do: [ :e |
		self push: e behind: firstElement ]
]

{ #category : #actions }
TRCanvas >> pushBack: aShape [
	(shapes includes: aShape)
		ifTrue: [ 	
				shapes remove: aShape.
				shapes addFirst: aShape ].

	(fixedShapes includes: aShape)
		ifTrue: [ 	
				fixedShapes remove: aShape.
				fixedShapes addFirst: aShape ]
]

{ #category : #actions }
TRCanvas >> pushFront: aShape [
	| tColl |
	tColl := aShape isFixed 
				ifTrue:  
					[ fixedShapes ]	
				ifFalse: 
					[ shapes ].
				
	tColl remove: aShape.
	tColl addLast: aShape 
]

{ #category : #animations }
TRCanvas >> removeAnimation: anAnimation [
	animations := animations copyWithout: anAnimation
]

{ #category : #actions }
TRCanvas >> removeFixedShape: aShape [
	fixedShapes := fixedShapes copyWithout: aShape
]

{ #category : #actions }
TRCanvas >> removeFixedShapes: someShapes [
	fixedShapes := fixedShapes copyWithoutAll: someShapes
]

{ #category : #'adding removing shapes' }
TRCanvas >> removeShape: shape [
	shapes remove: shape ifAbsent: [ self removeFixedShape: shape ].
	shape canvas: nil.
	shape triggerRemoveCallbacks
]

{ #category : #'adding removing shapes' }
TRCanvas >> removeShapes: someShapes [
	shapes := shapes copyWithoutAll: someShapes.
	self removeFixedShapes: someShapes.
	someShapes do: [ :aShape | aShape canvas: nil; triggerRemoveCallbacks ].
	
]

{ #category : #actions }
TRCanvas >> resetLineShapes [
	"Remove all the shapes, no callback on the shapes is invoked!"
	shapes := shapes reject: #isLineShape
]

{ #category : #actions }
TRCanvas >> resetShapes [
	"Remove all the shapes, no callback on the shapes is invoked!"
	shapes := OrderedCollection new.
]

{ #category : #actions }
TRCanvas >> setAsFixed: aShape [

	self removeShape: aShape.
	self addFixedShape: aShape.
	

]

{ #category : #accessing }
TRCanvas >> shapeForPosition: position [
	"Return the Trachel shape located at position"
	fixedShapes reverseDo: [ :s | 
		(s includesPoint: position) ifTrue: [ ^ s ] ].

	shapes reverseDo: [ :s | 
		(s includesPoint: position) ifTrue: [ ^ s ] ].
	^ self
]

{ #category : #accessing }
TRCanvas >> shapeForPositionInPixels: position [
	"position is in pixel, it corresponds to the physical location in the window.
	e.g., 0 @ 0 is top left of the window"
	fixedShapes reverseDo: [ :s | 
		(s includesPoint: position) ifTrue: [ ^ s ] ].

	shapes reverseDo: [ :s | 
		(s includesPoint: (self camera fromPixelToSpace: position)) ifTrue: [ ^ s ] ].
	^ self
]

{ #category : #accessing }
TRCanvas >> shapeWithAction: eventClass forPositionInPixels: position [
	"position is in pixel, it corresponds to the physical location in the window.
	e.g., 0 @ 0 is top left of the window"
	| pos |
	fixedShapes reverseDo: [ :s | 
		((s includesPoint: position) and: [ s announcer handleEventClass: eventClass ]) ifTrue: [ ^ s ] ].
	pos := self camera fromPixelToSpace: position.
	shapes reverseDo: [ :s | 
		((s includesPoint: pos) 
			and: [ s announcer handleEventClass: eventClass ]) ifTrue: [ ^ s ] ].
	^ self
]

{ #category : #accessing }
TRCanvas >> shapeWithAction: eventClass forPositionInPixels: position under: aShape [
	"position is in pixel, it corresponds to the physical location in the window.
	e.g., 0 @ 0 is top left of the window"

	| pos |
	pos := self camera fromPixelToSpace: position.
	shapes
		reverseDo: [ :s | 
			(s ~= aShape
				and: [ (s includesPoint: pos) and: [ s announcer handleEventClass: eventClass ] ])
				ifTrue: [ ^ s ] ].
	^ self
]

{ #category : #accessing }
TRCanvas >> shapeWithActionForPosition: position [
	"Return a Trachel Shape for a given position that answer events"
	fixedShapes reverseDo: [ :s | 
		((s includesPoint: position) and: [ s hasEventCallback ]) ifTrue: [ ^ s ] ].

	shapes reverseDo: [ :s | 
		((s includesPoint: position) and: [ s hasEventCallback ]) ifTrue: [ ^ s ] ].
	^ self
]

{ #category : #accessing }
TRCanvas >> shapeWithActionForPositionInPixels: position [
	"position is in pixel, it corresponds to the physical location in the window.
	e.g., 0 @ 0 is top left of the window"
	| pos |
	fixedShapes reverseDo: [ :s | 
		((s includesPoint: position) and: [ s hasEventCallback ]) ifTrue: [ ^ s ] ].
	pos := self camera fromPixelToSpace: position.
	shapes reverseDo: [ :s | 
		((s includesPoint: pos) 
			and: [ s hasEventCallback ]) ifTrue: [ ^ s ] ].
	^ self
]

{ #category : #accessing }
TRCanvas >> shapes [
	"Return the list of shapes"
	^ shapes asArray
]

{ #category : #updating }
TRCanvas >> signalUpdate [
	morph changed
]

{ #category : #accessing }
TRCanvas >> theme [
	"Return the theme used by TRCanvas. Note that the theme may be nil. In that case, it means that the theme will be infered by TRMorph (if Pharo is the running platform)"
	^ theme
]

{ #category : #accessing }
TRCanvas >> theme: aTheme [
	"Set the theme used by the Trachel Canvas."
	self assert: [ aTheme isKindOf: TRTheme ].
	theme := aTheme.
	self color: theme trachelCanvasColor
]

{ #category : #accessing }
TRCanvas >> topLeft [

	^ morph
		ifNil:[ 0@0 ]
		ifNotNil: [ morph topLeft ]
]

{ #category : #events }
TRCanvas >> when: event do: aBlock [
	self announcer when: event do: aBlock
]
