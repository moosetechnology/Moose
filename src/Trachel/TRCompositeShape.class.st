Class {
	#name : #TRCompositeShape,
	#superclass : #TRShape,
	#instVars : [
		'shapeAndOffsets'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #visitor }
TRCompositeShape >> accept: aVisitor [
	aVisitor visitMultiCompositeShape: self.
]

{ #category : #callbacks }
TRCompositeShape >> addCallback: aCallback [
	"Add a call back to only one subshape. This is necessary for example when one does not want to trigger many times the same callback when an action occurs"
	^ self firstShape addCallback: aCallback
]

{ #category : #callbacks }
TRCompositeShape >> addCallbackToAllShapes: aCallback [
	^ self shapesDo: [ :s | s addCallback: aCallback ]
]

{ #category : #'public - adding' }
TRCompositeShape >> addShape: aShape [
	"Add a shape in the composite. Shapes added using this method have all the same center"
	^ self addShape: aShape translateBy: 0 @ 0
]

{ #category : #'public - adding' }
TRCompositeShape >> addShape: aShape translateBy: aPoint [
	shapeAndOffsets add: (Array with: aShape with: aPoint)
]

{ #category : #actions }
TRCompositeShape >> addedIn: aCanvas [
	"Make sure we are in the center. This is apparently necessary for element Shape. The following code is not nice at all :-("

	self
		propagateElement;
		shapesDo: [ :s | s addedIn: aCanvas ];
		positionShapesAfterBeingAdded
]

{ #category : #actions }
TRCompositeShape >> addedIn: aCanvas atIndex: index [
	self propagateElement.
	shapeAndOffsets
		do: [ :tuple | 
			aCanvas addShape: tuple first atIndex: index.
			tuple first translateBy: tuple second ].
		
	"Make sure we are in the center"
	self translateBy: self position negated
]

{ #category : #'public - layout' }
TRCompositeShape >> alignRight [
	"Layout the shapes horizontally"

	"TRConstraint alignFromRight: self shapes."
	RTAlignment new elements: self shapes; right.
	shapeAndOffsets do: [ :tuple | tuple at: 2 put: tuple first position ].
	self resetInnerShapes
]

{ #category : #accessing }
TRCompositeShape >> allColor: aColor [
	"Set color of all shapes"
	self shapesDo: [ :s | s color: aColor ]
]

{ #category : #'public - layout' }
TRCompositeShape >> allOfSameSize [
	"All the same will have the same maximum size"

	| maxSize |
	maxSize := shapeAndOffsets inject: 0 @ 0 into: [ :max :tuple | tuple first extent max: max ].
	self shapesDo: [ :s | s extent: maxSize ]
]

{ #category : #'public - layout' }
TRCompositeShape >> allOfSameSizeWithPadding [
	"All the same will have the same maximum size"

	| maxSize padding |
	padding := 10 @ 10.
	maxSize := shapeAndOffsets inject: 0 @ 0 into: [ :max :tuple | tuple first extent max: max ].
	self shapesDo: [ :s | s extent: maxSize + padding ]
]

{ #category : #accessing }
TRCompositeShape >> allShapes [
	"Return all the shapes contained in me."
	^ shapeAndOffsets collect: #first as: Array
]

{ #category : #events }
TRCompositeShape >> announce: anEvent [
	self shapesDo: [ :s | s announce: anEvent ]
]

{ #category : #accessing }
TRCompositeShape >> announcer [
	self error: 'should not be called'
]

{ #category : #accessing }
TRCompositeShape >> announcer: anAnnouncer [
	self shapesDo: [ :s | s announcer: anAnnouncer ]
]

{ #category : #callbacks }
TRCompositeShape >> callbacks [
	^ self firstShape callbacks
]

{ #category : #accessing }
TRCompositeShape >> canvas [
	"Return the canvas of one of the shapes"
	^ self firstShape canvas	
]

{ #category : #accessing }
TRCompositeShape >> canvas: aSurface [
	"aCanvas is a AthensCairoSurface"
	self shapesDo: [ :s | s canvas: aSurface ]
]

{ #category : #accessing }
TRCompositeShape >> center [
	^ self encompassingRectangle center
]

{ #category : #accessing }
TRCompositeShape >> color [
	^ self firstShape color
	"shape2 color: aColor."
]

{ #category : #accessing }
TRCompositeShape >> color: aColor [
	"Simply set the first shape"
	self firstShape color: aColor.

]

{ #category : #private }
TRCompositeShape >> computePath [
	self shapesDo: [ :s | s computePath ]
]

{ #category : #drawing }
TRCompositeShape >> drawOn: athensCanvas [
	self shapesDo: [ :s | s drawOn: athensCanvas ]
]

{ #category : #accessing }
TRCompositeShape >> encompassingRectangle [
	"Really ugly method."
	| ans c |
	(self shapes anySatisfy: [ :s | s canvas notNil ])
		ifTrue: [ ^ Rectangle merging: (self shapes collect: #encompassingRectangle). ]. 
	
	c := shapeAndOffsets collect: [ :s | s first position ].
	self positionShapesAfterBeingAdded.
	ans := Rectangle merging: (self shapes collect: #encompassingRectangle).
	shapeAndOffsets with: c do: [ :s :p | s first translateTo: p ].
	^ ans
]

{ #category : #accessing }
TRCompositeShape >> extent [
	| res |
"	self shapesDo: [ :s | s translateTo: 0 @ 0 ]."
		
	shapeAndOffsets do: [ :tuple | tuple first translateBy: tuple second ].
	res := self encompassingRectangle extent.
	self shapesDo: [ :s | s translateTo: 0 @ 0 ].
	^ res

	"We cannot do that, because we may need to get the extent, without having the elements added (and correctly positioned)"
	"^ self encompassingRectangle extent"
]

{ #category : #actions }
TRCompositeShape >> extent: anExtent [
	self shapesDo: [ :s | s extent: anExtent ]
]

{ #category : #accessing }
TRCompositeShape >> firstShape [
	^ shapeAndOffsets first first
]

{ #category : #actions }
TRCompositeShape >> from [
	"To be compatible with edges"
	self shapesDo: [ :s | 
		(s class canUnderstand: #from) ifTrue: [ ^ s from ].
		 ].
	^ nil
]

{ #category : #actions }
TRCompositeShape >> from: p [
	"To be compatible with edges"
	self shapesDo: [ :s | 
		(s class canUnderstand: #from:) ifTrue: [ s from: p ].
		 ]
]

{ #category : #actions }
TRCompositeShape >> from: p1 to: p2 [
	"To be compatible with edges"
	self shapesDo: [ :s | 
		(s class canUnderstand: #from:to:) ifTrue: [ s from: p1 to: p2 ].
		(s class canUnderstand: #from:) ifTrue: [ s from: p1 ].
		(s class canUnderstand: #to:) ifTrue: [ s to: p2 ].
		 ]
]

{ #category : #callbacks }
TRCompositeShape >> hasCallback [
	"Return true if at least one callback has been added to the shape"
	^ self firstShape hasCallback
]

{ #category : #accessing }
TRCompositeShape >> height [
	^ self encompassingRectangle height
]

{ #category : #accessing }
TRCompositeShape >> height: aValue [
	^ self extent: self width @ aValue
]

{ #category : #'public - layout' }
TRCompositeShape >> horizontal [
	"Layout the shapes horizontally"

	| previousShape newPosition |
	previousShape := self firstShape.
	shapeAndOffsets allButFirst
		do: [ :tuple | 
			newPosition := previousShape center + ((previousShape extent x / 2) @ 0) + ((tuple first extent x / 2) @ 0).
			tuple first translateTo: newPosition.
			tuple at: 2 put: newPosition.
			previousShape := tuple first ].
	self resetInnerShapes
]

{ #category : #testing }
TRCompositeShape >> includesPoint: aPoint [
	^ self shapes anySatisfy: [ :s | s includesPoint: aPoint ]
]

{ #category : #accessing }
TRCompositeShape >> indexInCanvas [
	^ canvas privateIndexInCanvasOf: self firstShape
]

{ #category : #initialization }
TRCompositeShape >> initialize [
	super initialize.
	shapeAndOffsets := OrderedCollection new
]

{ #category : #actions }
TRCompositeShape >> isFixed [
	^ self shapes allSatisfy: #isFixed
]

{ #category : #'public - layout' }
TRCompositeShape >> noLayout [
	"Do nothing here"
]

{ #category : #accessing }
TRCompositeShape >> numberOfShapes [
	"Return the number of shapes added into myself"
	^ shapeAndOffsets size
]

{ #category : #accessing }
TRCompositeShape >> offsetOf: aTrachelShape [
	^ (shapeAndOffsets detect: [ :shapeAndOffset | shapeAndOffset first == aTrachelShape ]) second
]

{ #category : #accessing }
TRCompositeShape >> offsets [ 
	^ shapeAndOffsets collect: #second
]

{ #category : #accessing }
TRCompositeShape >> position [
	shapeAndOffsets ifEmpty: [ ^ 0 @ 0 ].
	^ (Rectangle merging: (self shapes collect: #encompassingRectangle)) center
	"^ self encompassingRectangle center"
]

{ #category : #actions }
TRCompositeShape >> positionShapesAfterBeingAdded [
	| p |
	p := self position.
	shapeAndOffsets do: [ :tuple | tuple first translateTo: tuple second ].
	(shapeAndOffsets anySatisfy: [ :tupple | tupple first isKindOf: TRAbstractLineShape ])
		ifFalse: [ self translateBy: p ]
]

{ #category : #actions }
TRCompositeShape >> propagateElement [
	"Make all the shape aware of the element"
	self shapesDo: [ :s | s element: self element ]
]

{ #category : #actions }
TRCompositeShape >> pushBack [
	self shapesDo: #pushBack
]

{ #category : #actions }
TRCompositeShape >> pushFront [
	self shapesDo: #pushFront
]

{ #category : #'public - layout' }
TRCompositeShape >> relayout [
	"This methods places the contained shapes according to the specified layout"
	| first |
	first := self firstShape.
	shapeAndOffsets do: [ :shapeAndOffset | 
		shapeAndOffset first translateBy: first position + shapeAndOffset second ]

]

{ #category : #actions }
TRCompositeShape >> remove [
	self shapesDo: #remove
]

{ #category : #removing }
TRCompositeShape >> removeShapesSuchAs: aBlock [
	"Remove all the shapes such as aBlock evaluated with the shape is true"
	shapeAndOffsets := shapeAndOffsets reject: [ :tupple | aBlock rtValue: tupple first ]
]

{ #category : #'public - layout' }
TRCompositeShape >> resetInnerShapes [
	self shapesDo: [ :s | s translateTo: 0 @ 0 ]
]

{ #category : #'public - layout' }
TRCompositeShape >> resetInnerShapesOffset [
	shapeAndOffsets := shapeAndOffsets collect: [ :tupple | Array with: tupple first with: 0 @ 0 ]
]

{ #category : #private }
TRCompositeShape >> resetPath [
	self shapesDo: #resetPath
]

{ #category : #actions }
TRCompositeShape >> setAsFixed [
	self shapesDo: #setAsFixed
]

{ #category : #accessing }
TRCompositeShape >> setShapes: someShapesWithOffsetAsPoint [
	shapeAndOffsets := someShapesWithOffsetAsPoint
]

{ #category : #accessing }
TRCompositeShape >> shapes [ 
	^ shapeAndOffsets collect: #first
]

{ #category : #accessing }
TRCompositeShape >> shapesDo: aBlock [
	"collect:thenDo: does not create temporary collection > improves performance"

	shapeAndOffsets collect: #first thenDo: aBlock
]

{ #category : #'public - forwarding' }
TRCompositeShape >> shapesInstancesOf: class [
	"Return the list of shapes instances or subinstances of the argument class"
	^ self allShapes select: [ :s | s isKindOf: class ]
]

{ #category : #actions }
TRCompositeShape >> signalUpdate [
	"Signal that the canvas should be refreshed"
	"Do nothing if I have no shapes added"

	shapeAndOffsets ifEmpty: [ ^ self ].
	self firstShape signalUpdate
]

{ #category : #actions }
TRCompositeShape >> to [
	"To be compatible with edges"
	self shapesDo: [ :s | 
		(s class canUnderstand: #to) ifTrue: [ ^ s to ].
		 ].
	^ nil
]

{ #category : #actions }
TRCompositeShape >> to: p [
	"To be compatible with edges"
	self shapesDo: [ :s | 
		(s class canUnderstand: #to:) ifTrue: [ s to: p ].
		 ]
]

{ #category : #actions }
TRCompositeShape >> translateBy: aPoint [
	self shapesDo: [ :s | s translateBy: aPoint ]

"	shapeAndOffsets do: [ :tupple | 
		tupple first class == TRMultiCompositeShape
			ifTrue: [ tupple first translateBy: aPoint + (tupple first encompassingRectangle extent / 2) ]
			ifFalse: [ tupple first translateBy: aPoint ] ]"
]

{ #category : #actions }
TRCompositeShape >> translateTo: aPoint [
	self translateBy: aPoint - self position
]

{ #category : #'public - layout' }
TRCompositeShape >> vertical [
	"Layout the shapes vertically"

	| previousShape newPosition |
	previousShape := self firstShape.
	shapeAndOffsets allButFirst
		do: [ :tupple | 
			newPosition := previousShape center + (0 @ (previousShape extent y / 2)) + (0 @ (tupple first extent y / 2)).
			tupple first translateTo: newPosition.
			tupple at: 2 put: newPosition.
			previousShape := tupple first ].
	self resetInnerShapes
]

{ #category : #'public - layout' }
TRCompositeShape >> verticalAndLeft [
	"Layout the shapes vertically and aligned on the left hand side"
	"TRConstraint alignFromLeft: (shapeAndOffsets collect: #first)."
	RTAlignment new elements: (shapeAndOffsets collect: #first); left.
	RTVerticalLineLayout new gapSize: 0; on: (shapeAndOffsets collect: #first).
	shapeAndOffsets doWithIndex: [ :tuple :index | tuple at: 2 put: (tuple first position "x @ (index * 20)") ].
	self resetInnerShapes.


"	| previousShape newPosition maxWidth offsetX |
	maxWidth := (shapeAndOffsets collect: [ :tuple | tuple first width ]) max.
	
	previousShape := shapeAndOffsets first first.
	shapeAndOffsets allButFirst do: [ :tupple |
		offsetX := (maxWidth - tupple first width) / -4.
		newPosition := (previousShape center + (offsetX @ (previousShape extent y / 2)) + (0 @ (tupple first extent y / 2))).
		tupple first translateTo: newPosition.
		tupple at: 2 put: newPosition.
		previousShape := tupple first ].
	self resetInnerShapes"
]

{ #category : #events }
TRCompositeShape >> when: event do: aBlock [
	self shapesDo: [ :s | s announcer when: event do: aBlock ]
]

{ #category : #accessing }
TRCompositeShape >> width [
	^ self encompassingRectangle width
]

{ #category : #accessing }
TRCompositeShape >> width: aValue [
	^ self extent: aValue @ self height
]
