"
Abstract class for the pad or bar builders
"
Class {
	#name : #RTAbstractScrollBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'fixedPosition',
		'size',
		'movable',
		'orientation',
		'width',
		'shapes',
		'barShape',
		'barSpecific',
		'encompassingRectangleFromSpaceToPixel',
		'encompassingRectangle',
		'fillColor'
	],
	#category : #'Roassal2-Builder-ScrollBar'
}

{ #category : #adding }
RTAbstractScrollBuilder >> addShapesToView [
	self shapes collection reverse do: [ :s | self view canvas addFixedShape: s ].
]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> barHeight [
	"To get the height of the bar for the vertical scroll bar."
	(self barSpecific = #scalable) ifTrue: [
		| max min s |
		
		max := self size -50.
		min := 30.
			
		s := (self size * (self view canvas extent y) / (self encompassingRectangleFromSpaceToPixel height) / self view canvas camera scale).
		
		(s > max) ifTrue: [ ^max ].
		(s < min) ifTrue: [ ^min ].
		^ s.
		
		] ifFalse: [ ^ self width]
]

{ #category : #accessing }
RTAbstractScrollBuilder >> barShape [
	^ barShape
]

{ #category : #accessing }
RTAbstractScrollBuilder >> barShape: aSymbol [
	barShape := aSymbol
]

{ #category : #accessing }
RTAbstractScrollBuilder >> barSpecific [
	^ barSpecific 
]

{ #category : #accessing }
RTAbstractScrollBuilder >> barSpecific: aSymbol [
	barSpecific := aSymbol 
]

{ #category : #'private - bar management' }
RTAbstractScrollBuilder >> barWidth [
	 "To get the width of the bar for the horizontal scroll bar. To change the width of the bar in general see #width:"
	(self barSpecific = #scalable) ifTrue: [
		| max min s |
		
		max := self size -50.
		min := 30.
		
		s := (self size * (self view canvas extent x) / (self encompassingRectangleFromSpaceToPixel width) / self view canvas camera scale).
		
		(s > max) ifTrue: [ ^max ].
		(s < min) ifTrue: [ ^min ].
		^ s.
		] ifFalse: [ ^ self width]
]

{ #category : #view }
RTAbstractScrollBuilder >> configureView: aView [
	aView.
]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> defaultEncompassingRectangle [
	self encompassingRectangle: (Rectangle origin: 0@0 corner: 10@10)

]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> defaultScrollBar [
	"all default values of scroll bar"
	self movable: #isMovable.
	self barShape: #anEllipse.
	self fixedPosition:  [ :v | (v view canvas extent x /2)@(v view canvas extent y  * 3 / 4)].
	self size: 200.
	self width: 10.
	self orientation: #horizontal.
	self fillColor: (Color lightGray alpha: 0).
]

{ #category : #accessing }
RTAbstractScrollBuilder >> encompassingRectangle [
	^ encompassingRectangle

]

{ #category : #accessing }
RTAbstractScrollBuilder >> encompassingRectangle: aRectangle [
	encompassingRectangle := aRectangle

]

{ #category : #accessing }
RTAbstractScrollBuilder >> encompassingRectangleFromSpaceToPixel [
	^ encompassingRectangleFromSpaceToPixel

]

{ #category : #accessing }
RTAbstractScrollBuilder >> encompassingRectangleFromSpaceToPixel: aRectangle [
	encompassingRectangleFromSpaceToPixel := aRectangle

]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> encompassingRectangleFromSpaceToPixelUpdate [
	self encompassingRectangleFromSpaceToPixel: (self view canvas camera fromSpaceToPixelForRectangle: (self encompassingRectangle))

]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> encompassingRectangleUpdate [
	self encompassingRectangle: (self view canvas camera encompassingRectangleOf: self view elements )

]

{ #category : #accessing }
RTAbstractScrollBuilder >> fillColor [
	^ fillColor
]

{ #category : #accessing }
RTAbstractScrollBuilder >> fillColor: aColor [
	fillColor := aColor
]

{ #category : #accessing }
RTAbstractScrollBuilder >> fixedPosition [
	"get the value of the initial fixed Position, in case of a block, evaluation of self"
	^ (fixedPosition rtValue: self).
]

{ #category : #accessing }
RTAbstractScrollBuilder >> fixedPosition: aPositionOrABlock [
	"set the initial position of the scroll bar, if a block, the block will be evaluated with 'cull self'. For example a block [:v | v view canvas extent] will set the position to canvas extent, just as [<myBuilder> view canvas extent]. If you want the scrollBar to be fully free and movable without reset position, set a point for fixedPosition."
	fixedPosition:= aPositionOrABlock 
]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> fixedPositionBlock [
	"get the block of the initial fixed Position"
	^ fixedPosition
]

{ #category : #initialization }
RTAbstractScrollBuilder >> initialize [
	super initialize.
	self configureView: view.
	self defaultScrollBar.


]

{ #category : #accessing }
RTAbstractScrollBuilder >> movable [
	^ movable
]

{ #category : #accessing }
RTAbstractScrollBuilder >> movable: aSymbol [
	movable := aSymbol
]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> notify [
	"Update the scroll bar"
	self encompassingRectangleUpdate.
	self encompassingRectangleFromSpaceToPixelUpdate.
	
	
	
]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> notifyWith: anElement [
	"Update the scroll bar and add the callback"
	self notify.
	anElement addCallback: (TRTranslationCallback new block: [ self encompassingRectangleUpdate. self encompassingRectangleFromSpaceToPixelUpdate. self signalUpdate.]).
	
	
	
]

{ #category : #accessing }
RTAbstractScrollBuilder >> orientation [
	^ orientation 
]

{ #category : #accessing }
RTAbstractScrollBuilder >> orientation: aSymbol [
	"set orientation of scroll bar, #horizontal or #vertical"
	orientation := aSymbol.
]

{ #category : #hooks }
RTAbstractScrollBuilder >> renderIn: aView [
	self shouldNotImplement 
	 
]

{ #category : #accessing }
RTAbstractScrollBuilder >> shapes [
	"the shapes used to build the scroll bar"
	^ shapes
]

{ #category : #accessing }
RTAbstractScrollBuilder >> shapes: aRTScrollBarShapes [
	"the shapes used to build the scroll bar"
	shapes := aRTScrollBarShapes
]

{ #category : #signalling }
RTAbstractScrollBuilder >> signalUpdate [
	
	"this method is used to increase the size of the shapes composing the scroll bar when the size is defined by a Block, for example to follow the size of the windows
	Or if the position is fixed on the border on the widows, the scroll bar should follow the windows border at signal updates"

	self assert: (self shapes isNotNil).

	(self shapes collection) ifNotEmpty: [ 
			
		(self sizeBlock isBlock) 
			ifTrue: [ self signalUpdateSize] 
			ifFalse: [ 
				(self orientation = #horizontal) 
					ifTrue: [ self positionOnBorderHorizontal] 
					ifFalse: [ self positionOnBorderVertical]
				].
			self signalUpdatePosition.
		].

	self view signalUpdate. 
	
]

{ #category : #accessing }
RTAbstractScrollBuilder >> size [
	"get the value of the size, in case of block, evaluation of self"
	^ size rtValue: self 
]

{ #category : #accessing }
RTAbstractScrollBuilder >> size: aSizeOraBlock [
	"set the size of scroll bar, it's length. If a block, the block will be evaluated with 'cull self'. For example a block [ :v | v view canvas extent x] will set the size to canvas width, just as [<myBuilder> view canvas extent x]"
	size:= aSizeOraBlock.
]

{ #category : #'as yet unclassified' }
RTAbstractScrollBuilder >> sizeBlock [
	"SizeBlock allows to get the block and not the result of the evaluation of the size block on size, obtained by self size"
	^ size.  
]

{ #category : #accessing }
RTAbstractScrollBuilder >> width [
	^ width
]

{ #category : #accessing }
RTAbstractScrollBuilder >> width: aSize [
	"set width of the scroll bar"
	width := aSize
]
