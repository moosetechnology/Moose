"
I am main tool which helps to move across Trachel's canvas.

My two main properties are position and scale.

- position 
  is a point representing coordinates of the canvas on which the ""viewing window"" will be centered.
  position can be changes with:
  * #translateBy:
  * #translateTo:
  both methods accept canvas based coordinates

- scale
  defines a magnitude of zooming applied to the canvas and it's elements.

I provide two methods that allow conversion between coanvas (space) coordinate system and real window(pixel)'s coordinates.
* #fromPixelToSpace:
* #fromSpaceToPixel:

Also I provide handy methods for centering camera on current elements and zoomeing to fit everuthing in the square with desired size (default 500pnt).
* #focusOnCenter
* #focusOnCenterScaled
* #focusOnCenterScaled:
"
Class {
	#name : #TRCamera,
	#superclass : #TRCallableObject,
	#instVars : [
		'position',
		'canvas',
		'scale',
		'initializer'
	],
	#classInstVars : [
		'nullCamera'
	],
	#category : #'Trachel-Core'
}

{ #category : #public }
TRCamera class >> forCanvas: aTrachelCanvas [

	^ super new canvas: aTrachelCanvas
]

{ #category : #public }
TRCamera class >> new [
	self error: 'Instance of this class have to be created with #forCanvas:'
]

{ #category : #public }
TRCamera class >> null [
	nullCamera ifNil: [ nullCamera := self forCanvas: TRCanvas new ].
	^ nullCamera
]

{ #category : #actions }
TRCamera >> adjust [
	"This method adjust the camera from the initializer. This method is called by RTView>>setUpCanvas, when opening the view"
	initializer executeOn: self
]

{ #category : #accessing }
TRCamera >> canvas [
	"Return the trachel canvas I am observing"
	^ canvas
]

{ #category : #accessing }
TRCamera >> canvas: aTrachelCanvas [
	"Set the canvas to observe"
	canvas := aTrachelCanvas
]

{ #category : #initialization }
TRCamera >> defaultCameraScale [
	^ 1.0001
]

{ #category : #convertion }
TRCamera >> distanceFromPixelToSpace: aPoint [
	^ (aPoint / self scale) asFloatPoint
	"^ AthensAffineTransform new scaleBy: (1 / self scale) asFloat; translation: aPoint; transform: aPoint"
]

{ #category : #utility }
TRCamera >> encompassingRectangle [
	"Return the encompassing rectangle of all the elements contained in the canvas"
	"Maybe a method encompassingRectangle has to be defined in TRCanvas?"
	^ self encompassingRectangleOf: canvas shapes
]

{ #category : #utility }
TRCamera >> encompassingRectangleOf: shapes [
	^ shapes asGroup encompassingRectangle 

]

{ #category : #actions }
TRCamera >> focusOnCenter [
	"Do nothing if no shape are present."

	canvas numberOfShapes = 0
		ifTrue: [ ^ self ].
	"Need to get the center by ourselves since Rectangle>>center truncate the result."
	"However convert to float point, because FFI down the line (AthensCairoMatrix>>translateX:Y:) cannot coerce Fraction. It could be converted there instead, but this is the only place I have ever encountered the problem in, so maybe don't do needless conversions all the time."
	self
		translateTo: (self encompassingRectangle in: [ :eR | (eR topLeft + eR bottomRight) / 2 ]) asFloatPoint
]

{ #category : #actions }
TRCamera >> focusOnCenterScaled [
	^ self focusOnCenterScaled: 500@500.
	
	
]

{ #category : #actions }
TRCamera >> focusOnCenterScaled: aFactor [
	| sc rec |
	canvas numberOfShapes = 0 ifTrue: [ ^ self ].
	rec := self encompassingRectangle.
	self translateTo: rec center.
	sc := aFactor / ((rec extent) max: 1 @ 1).
	sc := (sc x < sc y) ifTrue: [sc x] ifFalse: [ sc y ].
	self scale: sc.
	^ sc
]

{ #category : #convertion }
TRCamera >> fromPixelToSpace: aPoint [

	^ TRPlatform current affineTransformClass new
		translateBy: self position;
		scaleBy: 1 / self scale;
		translateBy: (self canvas extent / 2) negated;
		transform: aPoint
]

{ #category : #convertion }
TRCamera >> fromPixelToSpaceForRectangle: aRectangle [
	"Return a new rectangle that corresponds to the projection of the argument (expressed in the space coordinate) into the pixels coordinate"
	^ (self fromPixelToSpace: aRectangle topLeft) corner: (self fromPixelToSpace: aRectangle bottomRight)
]

{ #category : #convertion }
TRCamera >> fromSpaceToPixel: aPoint [

	^ TRPlatform current affineTransformClass new
		translateBy: self canvas extent / 2;
		scaleBy: self scale;
		translateBy: self position negated;
		transform: aPoint
	
]

{ #category : #convertion }
TRCamera >> fromSpaceToPixelForRectangle: aRectangle [

	^ (self fromSpaceToPixel: aRectangle topLeft) corner: (self fromSpaceToPixel: aRectangle bottomRight)
]

{ #category : #initialization }
TRCamera >> initialize [
	super initialize.
	position := 0 @ 0.
	scale := self defaultCameraScale.
	initializer := TRCameraInitializer focusOnCenter
]

{ #category : #'testing visibility' }
TRCamera >> isVisible: aShape [
	"Return true if aShape is fully or partially visible. I.e., the encompassing bounds of aShape intersects of the of the canvas "
	| rec ext |
	rec := aShape encompassingRectangle.
	rec := self fromSpaceToPixelForRectangle: rec.
	ext := self canvas extent.
	^ (0 @ 0 extent: ext) intersects: rec
]

{ #category : #actions }
TRCamera >> noInitializationWhenOpen [
	"The default behavior, is when a canvas is open, the camera is set at the center of all the elements."
	self toAdjust: (TRCameraInitializer new block: [ :camera | ]).
]

{ #category : #accessing }
TRCamera >> position [
	"Return the position of the camera, in the space coordinates"
	^ position
]

{ #category : #accessing }
TRCamera >> scale [
	"Return an integer corresponding to the scaling"
	^ scale
]

{ #category : #accessing }
TRCamera >> scale: aNewScaleAsInteger [
	scale := aNewScaleAsInteger.
	self triggerCallbacksForScale: aNewScaleAsInteger
]

{ #category : #accessing }
TRCamera >> toAdjust: aCameraInitializer [
	initializer := aCameraInitializer
]

{ #category : #actions }
TRCamera >> translateBy: aPoint [
	"Move the camera using a step"
	position := position + aPoint.
	self triggerCallbacksForStep: aPoint
]

{ #category : #actions }
TRCamera >> translateTo: newPosition [
	"Move the camera to a new position. Note that some callbacks may be triggered"
	| step |
	step := newPosition - position.
	position := newPosition.
	self triggerCallbacksForStep: step.
]

{ #category : #callbacks }
TRCamera >> triggerCallbacksForScale: aScaleFactor [
	callbacks ifNil: [ ^ self ].
	callbacks do: [ :c | 
		c isCameraScaleCallback ifTrue: [ 
			c scaleChanged: aScaleFactor ] ]
]
