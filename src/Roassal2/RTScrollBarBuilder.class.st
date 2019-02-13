"
A RTScrollBarBuilder is a scroll bar that you can add to navigate in your view. More than a Draggable view, it allows to keep a mark about your position in the view and it scale for large views. 

It can be static, movable, using #isStatic or #isMovable
aving an orientation #vertical or #horizontal.

the default configuration is #isBasic and #isStatic,

the bar shape is defined by #barShape: <#aBox or default value #anEllipse>
the bar can have a specificity like #scalable, so it give an idea of the size of the view.

Size or fixedPosition can be defined as blocks.

width: to set a static size of width.
"
Class {
	#name : #RTScrollBarBuilder,
	#superclass : #RTAbstractScrollBuilder,
	#category : #'Roassal2-Builder-ScrollBar'
}

{ #category : #adding }
RTScrollBarBuilder >> addAnimations [
	"add animations on the bar, to make the scroll bar movable or not etc.. Callbacks on resize, drag and drop... A lot of precise case to reduce costly full update at maximum"
	| bar surroundingRectangle margeRectangle |

	bar := self shapes bar.
	surroundingRectangle := self shapes surroundingRectangle.
	margeRectangle := self shapes margeRectangle.

	"bar and view drag animations"
	(self orientation = #horizontal) ifTrue: [ 
		self barDragHorizontal.
		self viewDragHorizontal.
		].

	(self orientation = #vertical) ifTrue: [ 
		self barDragVertical.
		self viewDragVertical.
		].
	
	"Move the scroll bar when movable animation"
	(self movable = #isMovable) ifTrue: [
		surroundingRectangle when: TRMouseDragging do: [ :evt |
			self shapes collection do: [ :s | s translateBy: (evt step) ].
			self view signalUpdate.
			]
		].
	
	"Callbacks when translate, resize or rescale canvas"
	self view elements do: [:e | e addCallback: (TRTranslationCallback new block: [
			self encompassingRectangleUpdate. self encompassingRectangleFromSpaceToPixelUpdate. self signalUpdate.])
		].
	
	self view when: TRResizeCanvasEvent do: [ :evt | self signalUpdate].
	
	self view canvas camera addCallback: (TRCameraScaleCallback new block: [ self encompassingRectangleFromSpaceToPixelUpdate. self signalUpdate. ]).



	
]

{ #category : #adding }
RTScrollBarBuilder >> barDragHorizontal [
	"Animation for a horizontal drag of the bar"
	self shapes bar when: TRMouseDragging do: [ :evt |
			
		(self encompassingRectangle containsPoint: (self view canvas camera position)) 
			ifFalse: [ (self view canvas camera) translateTo:  ((self encompassingRectangle) pointNearestTo: (self view canvas camera position))  ].
			
		(self shapes margeRectangle includesPoint: (self shapes bar position + ((evt step x)@0))) & (self shapes surroundingRectangle includesPoint: (evt position x)@(self shapes bar position y)) 
			ifTrue: [  
				self shapes bar translateBy: (evt step x)@0.
				self view canvas camera translateBy: (self translationHorizontal: evt).
				].
			
		self view signalUpdate.
		]
]

{ #category : #adding }
RTScrollBarBuilder >> barDragVertical [
	"Animation for a horizontal drag of the bar"
	self shapes bar when: TRMouseDragging do: [ :evt |
		
		(self encompassingRectangle containsPoint: (self view canvas camera position)) 
			ifFalse: [ (self view canvas camera) translateTo:  ((self encompassingRectangle) pointNearestTo: (self view canvas camera position))  ].
			
		(self shapes margeRectangle includesPoint: (self shapes bar position + (0@(evt step y)))) & (self shapes surroundingRectangle includesPoint: (self shapes bar position x)@(evt position y)) 
			ifTrue: [  
				self shapes bar translateBy: 0@(evt step y).
				self view canvas camera translateBy: (self translationVertical: evt).
				].
		
		self view signalUpdate.
		]
]

{ #category : #'as yet unclassified' }
RTScrollBarBuilder >> defineShapes [
	"define shapes if scrollBar is horizontal or vertical."

	"set bar shape, the draggable shape."	
	(self barShape = #aBox) 
		ifTrue: [ self shapes bar: TRBoxShape new ] 
		ifFalse: [ self shapes bar: TREllipseShape new ].

	"Start and stop are made to show the border of scroll Bar"
	(self orientation = #horizontal) ifTrue: [
		self shapes defineHorizontalShapes. 
	].

	(self orientation = #vertical) ifTrue: [ 	
		self shapes defineVerticalShapes. 	
	].
	
]

{ #category : #initialization }
RTScrollBarBuilder >> initialize [
	super initialize.
	self shapes: (RTScrollShapesBuilder for: self).
]

{ #category : #'as yet unclassified' }
RTScrollBarBuilder >> positionOnBorderHorizontal [

	((self shapes bar position x - (self barWidth / 2)) < (self shapes surroundingRectangle encompassingRectangle origin x)) ifTrue: [ self shapes bar translateTo: ((self shapes surroundingRectangle encompassingRectangle origin x) + (self barWidth / 2))@(self shapes surroundingRectangle position y)].
	((self shapes bar position x + (self barWidth / 2)) > (self shapes surroundingRectangle encompassingRectangle corner x)) ifTrue: [ self shapes bar translateTo: ((self shapes surroundingRectangle encompassingRectangle corner x) - (self barWidth / 2))@(self shapes surroundingRectangle position  y)].
]

{ #category : #'as yet unclassified' }
RTScrollBarBuilder >> positionOnBorderVertical [

	((self shapes bar position y - (self barHeight / 2)) < (self shapes surroundingRectangle encompassingRectangle origin y)) ifTrue: [ self shapes bar translateTo: (self shapes surroundingRectangle position  x)@(self shapes surroundingRectangle encompassingRectangle origin y + (self barHeight / 2))].
	((self shapes bar position y + (self barHeight / 2)) > (self shapes surroundingRectangle encompassingRectangle corner y)) ifTrue: [ self shapes bar translateTo: (self shapes surroundingRectangle position  x)@(self shapes surroundingRectangle encompassingRectangle corner y - (self barHeight / 2))].

]

{ #category : #hooks }
RTScrollBarBuilder >> renderIn: aView [

	(self view elements isEmpty) ifTrue: [self defaultEncompassingRectangle] ifFalse: [ self encompassingRectangleUpdate ].
	self encompassingRectangleFromSpaceToPixelUpdate.

	self defineShapes.
	self addShapesToView.
	self addAnimations.

]

{ #category : #'as yet unclassified' }
RTScrollBarBuilder >> reverseTranslationHorizontal: evt [
	| t |

	t := ((evt step x)  / (self encompassingRectangleFromSpaceToPixel width )) * (self size - self shapes bar width).
		
	^ (t negated)@0
]

{ #category : #'as yet unclassified' }
RTScrollBarBuilder >> reverseTranslationVertical: evt [
	| t |

	t := ((evt step y)  / (self encompassingRectangleFromSpaceToPixel height)) * (self size - self shapes bar height).
		
	^ 0@(t negated)
]

{ #category : #signalling }
RTScrollBarBuilder >> signalUpdatePosition [
	| pr pos sizeNow |
	
	pos := self fixedPosition.
	sizeNow := self size.
		
			(self orientation = #horizontal) ifTrue: [	
				pr := (((self view canvas camera position x) - (self encompassingRectangle origin x)) / (self encompassingRectangle width)) * sizeNow.
				self shapes surroundingRectangle position: pos.
				self shapes bar position: (pr + (self shapes surroundingRectangle encompassingRectangle origin x ))@(pos y).
				self positionOnBorderHorizontal.	
				].
			
			(self orientation = #vertical) ifTrue: [		
				pr := (((0@(self view canvas camera position y)) dist: (0@(self encompassingRectangle origin y))) / (self encompassingRectangle height)) * (self shapes surroundingRectangle height).
				self shapes surroundingRectangle position: pos.
				self shapes bar position: (pos x)@(pr + (self shapes surroundingRectangle encompassingRectangle origin y)).
				self positionOnBorderVertical.
			].
		
		self shapes margeRectangle position: pos.	
]

{ #category : #signalling }
RTScrollBarBuilder >> signalUpdateSize [
	| sizeNow |

	sizeNow := self size.
	(self orientation = #horizontal) ifTrue: [
				self shapes surroundingRectangle width: sizeNow.
				self shapes margeRectangle width: (sizeNow - self barWidth).		
				self shapes bar width: self barWidth.
				].
			
	(self orientation = #vertical) ifTrue: [	
				self shapes surroundingRectangle height: sizeNow.
				self shapes margeRectangle height: (sizeNow - (self barHeight)).
				self shapes bar height: self barHeight.
				].
				
				
]

{ #category : #'as yet unclassified' }
RTScrollBarBuilder >> translationHorizontal: evt [
	| t |

	t := ((evt step x) / (self size  - self shapes bar width)) * ((self encompassingRectangleFromSpaceToPixel width) / self view canvas camera scale).
	
	^ t@0
]

{ #category : #'as yet unclassified' }
RTScrollBarBuilder >> translationVertical: evt [
	| t |

	t := ((evt step y) / (self size  - self shapes bar height)) * ((self encompassingRectangleFromSpaceToPixel height) / self view canvas camera scale).
	
	^ 0@t
]

{ #category : #adding }
RTScrollBarBuilder >> viewDragHorizontal [
	"Animation for a horizontal drag of the view"
	self view when: TRMouseDragging do: [ :evt | 
		| translation |
		translation := (self reverseTranslationHorizontal: evt).
		((self shapes margeRectangle includesPoint: (self shapes bar position + translation))) ifTrue: [ 
			shapes bar translateBy: translation.
			self view signalUpdate
			]. 
		].
]

{ #category : #adding }
RTScrollBarBuilder >> viewDragVertical [
	"Animation for a vertical drag of the view"
	self view when: TRMouseDragging do: [ :evt | 
		| translation |
		translation := (self reverseTranslationVertical: evt).
		((self shapes margeRectangle includesPoint: (self shapes bar position + translation))) ifTrue: [ 
			shapes bar translateBy: translation.
			self view signalUpdate
			]. 
		].

]
