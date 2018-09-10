"
A TRAbstractLineDecoratorShape represents the shape of a RTLineDecoration.

The ""open"" field refers to the shape itself. If it is a closed, paintable shape, or an open shape.
"
Class {
	#name : #TRAbstractLineDecoratorShape,
	#superclass : #TRShape,
	#instVars : [
		'size',
		'to',
		'from',
		'width',
		'open',
		'type',
		'baseSize',
		'percentage'
	],
	#category : #'Trachel-ShapesForArrow'
}

{ #category : #'as yet unclassified' }
TRAbstractLineDecoratorShape class >> from: aPoint to: anotherPoint width: aNumber size: anotherNumber color: aColor stroke: anotherColor [
	^self new from: aPoint; to: anotherPoint; width: aNumber; size: anotherNumber; color: aColor; strokePaint: anotherColor.
]

{ #category : #'as yet unclassified' }
TRAbstractLineDecoratorShape class >> fromEdge: anEdge size: aNumber [
	^self fromLine: anEdge trachelShape size: aNumber
]

{ #category : #'as yet unclassified' }
TRAbstractLineDecoratorShape class >> fromEdge: anEdge size: aNumber color: aColor [
	^self fromLine: anEdge trachelShape size: aNumber color: aColor 
]

{ #category : #'as yet unclassified' }
TRAbstractLineDecoratorShape class >> fromLine: aTRLine size: aNumber [
	^self from: aTRLine from to: aTRLine to width: aTRLine width size: aNumber color: aTRLine color stroke: aTRLine strokePaint.
]

{ #category : #'as yet unclassified' }
TRAbstractLineDecoratorShape class >> fromLine: aTRLine size: aNumber color: aColor [
	^self from: aTRLine from to: aTRLine to width: aTRLine width size: aNumber color: aColor stroke: aTRLine strokePaint.
]

{ #category : #visitor }
TRAbstractLineDecoratorShape >> accept: aVisitor [
	aVisitor visitAbstractLineDecorationShape: self
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> baseSize [
	^ baseSize
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> baseSize: aNumber [
	"Set the base size of the head. Initially, the baseSize is equals to the size of the arrow head."
	baseSize := aNumber
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> center [
	"Not sure whether this is right"
	^ self to
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> color: aColor [
	self strokePaint: aColor
]

{ #category : #hooks }
TRAbstractLineDecoratorShape >> computePath [
	self subclassResponsibility
]

{ #category : #defaults }
TRAbstractLineDecoratorShape >> defaultColor [
	^ Color white
]

{ #category : #defaults }
TRAbstractLineDecoratorShape >> defaultSize [
	^ 10
]

{ #category : #defaults }
TRAbstractLineDecoratorShape >> defaultWidth [
	^ 1
]

{ #category : #drawing }
TRAbstractLineDecoratorShape >> drawOn: athensCanvas [
	from ~= to 
		ifTrue: [  
			athensCanvas pathTransform restoreAfter: [ 
				athensCanvas setShape: self path.
				open 
					ifFalse: [
						athensCanvas setPaint: self themedColor.
						athensCanvas draw ].
				(athensCanvas setStrokePaint: self themedStrokeColor) width: self width.
				athensCanvas draw ] ]
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> encompassingRectangle [
	^ Rectangle encompassing: (Array with: from with: to)
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> from [
	^ from
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> from: anObject [
	from := anObject
]

{ #category : #initialization }
TRAbstractLineDecoratorShape >> initialize [
	super initialize.
	size := self defaultSize.
	baseSize := size.
	
	color := self defaultColor.
	strokePaint := self defaultColor.
	width := 1.
	open := false.
	percentage := 1.

]

{ #category : #testing }
TRAbstractLineDecoratorShape >> isOpen [
	^ open
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> mySize [
	^ size
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> percentage [
	^ percentage
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> percentage: aNumber [
	self assert: (aNumber between: 0 and: 1).
	percentage := aNumber.
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> size: anObject [
	anObject  = nil 
		ifTrue: [ size := self defaultSize. ]
		ifFalse: [ size := anObject ]
	
	
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> to [
	^ to
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> to: anObject [
	to := anObject
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> width [
	^ width
]

{ #category : #accessing }
TRAbstractLineDecoratorShape >> width: anObject [
	anObject  = nil 
		ifTrue: [ width := self defaultWidth. ]
		ifFalse: [ width := anObject ]
]
