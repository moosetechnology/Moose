"
A RTScrollPadBuilder is a scroll pad that you can add to navigate in two dimension in your view. More than a Draggable view, it allows to keep a mark about your position in the view and it scale for large views. 

It can be static, movable, using #isStatic or #isMovable
aving an orientation #vertical or #horizontal.

the default configuration is #isBasic and #isStatic,

the bar shape is defined by #barShape: <#aBox or default value #anEllipse>
the bar can have a specificity like #scalable, so it give an idea of the size of the view.

Size or fixedPosition can be defined as blocks.

width: to set a static size of width.
"
Class {
	#name : #RTScrollPadBuilder,
	#superclass : #RTAbstractScrollBuilder,
	#category : #'Roassal2-Builder-ScrollBar'
}

{ #category : #adding }
RTScrollPadBuilder >> addAnimations [

	| bar surroundingRectangle margeRectangle |
	bar := self shapes bar.
	surroundingRectangle := self shapes surroundingRectangle.
	margeRectangle := self shapes margeRectangle.

	bar when: TRMouseDragging do: [ :evt |
		
		(self encompassingRectangle containsPoint: (self view canvas camera position)) ifFalse: [ (self view canvas camera) translateTo:  ((self encompassingRectangle) pointNearestTo: (self view canvas camera position))  ].
		
		(margeRectangle includesPoint: (bar position + evt step)) & (surroundingRectangle includesPoint: evt position) ifTrue: [  
			bar translateBy: evt step.
			self view canvas camera translateBy: (self translation: evt).
		].
		self view signalUpdate.
		].
	
	(self movable = #isMovable) ifTrue: [
		surroundingRectangle when: TRMouseDragging do: [ :evt |
			self shapes collection do: [ :s | s translateBy: (evt step) ].
			self view signalUpdate.
			]
		].
	
		
	self view when: TRMouseDragging do: [ :evt | 
		| translation |
		translation := (self reverseTranslation: evt).
		((margeRectangle includesPoint: (bar position + translation)) & ((self encompassingRectangle ) containsPoint: (self view canvas camera position))) ifTrue: [ 
			shapes bar translateBy: translation.
			self view signalUpdate
			]. 
		].
	
	self view elements do: [:e | e addCallback: (TRTranslationCallback new block: [
			self encompassingRectangleUpdate. self encompassingRectangleFromSpaceToPixelUpdate. self signalUpdate.])
		].	
	self view when: TRResizeCanvasEvent do: [ :evt | self signalUpdate].
	self view canvas camera addCallback: (TRCameraScaleCallback new block: [ self encompassingRectangleFromSpaceToPixelUpdate. self signalUpdate. ]).


	
]

{ #category : #'as yet unclassified' }
RTScrollPadBuilder >> defineShapes [
	|  bar surroundingRectangle margeRectangle |
	
	"set bar shape"	
	(self barShape = #aBox) ifTrue: [ bar := TRBoxShape new ] ifFalse: [ bar := TREllipseShape new ].
	
	"bar is the shape to drag and drop"
	bar height: self barHeight; width: self barWidth; color: (Color lightGray);  position: self fixedPosition; strokePaint: nil.
		
	"This shape is the the fill of the scroll pad"
	surroundingRectangle := TRBoxShape new fromRectangle: (Rectangle origin: (self fixedPosition x - (self size / 2)) @ (self fixedPosition y - (self size / 2)) corner:(self fixedPosition x + (self size / 2)) @ (self fixedPosition y + (self size / 2))); color: (Color gray alpha: 0.1); strokePaint: nil.
	
	"the margeRectangle handle the width/2 of the bar"
	margeRectangle := TRBoxShape new fromRectangle: (Rectangle origin: (surroundingRectangle encompassingRectangle origin + ((bar width /2)@(bar height /2)))corner: (surroundingRectangle encompassingRectangle corner - ((bar width /2)@(bar height /2)))); color: (Color gray alpha:0); strokePaint: nil .

	self shapes bar: bar; surroundingRectangle: surroundingRectangle; margeRectangle: margeRectangle.
	
	
]

{ #category : #initialization }
RTScrollPadBuilder >> initialize [
	super initialize.
	self shapes: RTScrollShapesBuilder new.
]

{ #category : #'as yet unclassified' }
RTScrollPadBuilder >> positionOnBorderHorizontal [
	((self shapes bar position x - (self barWidth / 2)) < (self shapes surroundingRectangle position x - (self size / 2))) ifTrue: [ self shapes bar translateTo: (self shapes surroundingRectangle position x - (self size / 2) + (self barWidth / 2))@(self shapes surroundingRectangle position y)].
				((self shapes bar position x + (self barWidth / 2)) > (self shapes surroundingRectangle position x + (self size / 2))) ifTrue: [ self shapes bar translateTo: (self shapes surroundingRectangle position x + (self size / 2) - (self barWidth / 2))@(self shapes surroundingRectangle position y)].
				
			((self shapes bar position y - (self barHeight / 2)) < (self shapes surroundingRectangle position y - (self size / 2))) ifTrue: [ self shapes bar translateTo: (self shapes surroundingRectangle position x)@(self shapes surroundingRectangle position y - (self size / 2) + (self barHeight / 2))].
				((self shapes bar position y + (self barHeight / 2)) > (self shapes surroundingRectangle position y + (self size / 2))) ifTrue: [ self shapes bar translateTo: (self shapes surroundingRectangle position x)@(self shapes surroundingRectangle position y + (self size / 2) - (self barHeight / 2))].	
]

{ #category : #hooks }
RTScrollPadBuilder >> renderIn: aView [
	
	(self view elements isEmpty) ifTrue: [self defaultEncompassingRectangle] ifFalse: [ self encompassingRectangleUpdate ].
	self encompassingRectangleFromSpaceToPixelUpdate.
	
	self defineShapes.
	self addShapesToView.
	self addAnimations.





	
]

{ #category : #'as yet unclassified' }
RTScrollPadBuilder >> reverseTranslation: evt [
	| tx ty |


	tx:= ((evt step x)  / (self encompassingRectangleFromSpaceToPixel width )) * (self size - self shapes bar width).
	
	ty := ((evt step y)  / (self encompassingRectangleFromSpaceToPixel height)) * (self size - self shapes bar height).
	
	^ (tx negated)@(ty negated)
]

{ #category : #signalling }
RTScrollPadBuilder >> signalUpdatePosition [

	| prx pry  org|

	(self movable = #isMovable) ifFalse: [ 		
		prx :=  ((self shapes bar position x)-(self shapes surroundingRectangle position x - (self shapes surroundingRectangle width/2))) / (self shapes surroundingRectangle width) * self size.
		pry := ((self shapes bar position y)-(self shapes surroundingRectangle position y - (self shapes surroundingRectangle height/2))) / (self shapes surroundingRectangle height) * self size.
				
		self shapes surroundingRectangle position: self fixedPosition.
		self shapes surroundingRectangle position: self fixedPosition.
	
		org := (self fixedPosition x - (self size / 2) )@(self fixedPosition y - (self size / 2) ).
				
		self shapes bar position: (prx + org x)@((pry + org y)).
		
		self positionOnBorderHorizontal.
		].
	

]

{ #category : #signalling }
RTScrollPadBuilder >> signalUpdateSize [
				
			self shapes surroundingRectangle width: self size.
			self shapes surroundingRectangle height: self size.
			self shapes margeRectangle width: (self size - (self barWidth)).
			self shapes margeRectangle height: (self size - (self barHeight)).
			self shapes bar width: self barWidth.
			self shapes bar height: self barHeight.			
			
			
	
]

{ #category : #accessing }
RTScrollPadBuilder >> translation: evt [
	| tx ty |
	
		tx := ((evt step x) / (self size  - self shapes bar width)) * ((self encompassingRectangleFromSpaceToPixel width) / self view canvas camera scale).
	ty := ((evt step y) / (self size  - self shapes bar height)) * ((self encompassingRectangleFromSpaceToPixel height) / self view canvas camera scale).
	
	^ tx@ty
]
