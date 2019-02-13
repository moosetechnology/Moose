"
Allow for avoiding collision between elements

-=-=-=
v := RTView new.

box1 := RTBox new size: 30; color: Color blue trans; element.
v add: box1.


box2 := RTBox new size: 30; color: Color blue trans; element.
v add: box2.
box2 translateBy: 100 @ 15.

draggable := RTBox new size: 10; color: Color red trans; element.
v add: draggable.
draggable translateBy: 100 @ 100.
draggable @ RTDraggable.

draggable @ (RTCollision new elementToCheckForCollision: {box1 . box2}).

v

-=-=-=
"
Class {
	#name : #RTCollision,
	#superclass : #RTInteraction,
	#instVars : [
		'elementToCheckForCollision',
		'callback'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #initialization }
RTCollision >> avoidOverlapWith: aShape step: step [
	"aShape is being moved by a translation of step pixels.
	This method avoids the translation"
	| delta tt side |
	^ (self checkCollistionFor: aShape)
		ifTrue: [ 
			| r en |
			en := aShape encompassingRectangle.
			r := (elementToCheckForCollision detect: [ :e | e encompassingRectangle intersects: en ]) encompassingRectangle.

			"We need to determine which side is the most relevant"
			
			tt := (r bottom - en top). side := #bottom.		
			(tt abs > (r right - en left) abs) ifTrue: [ tt := r right - en left. side := #right ].
			(tt abs > (r top - en bottom) abs) ifTrue: [ tt := r top - en bottom. side := #top ].
			(tt abs > (r left - en right) abs) ifTrue: [ tt := r left - en right. side := #left ].
			
			side == #right ifTrue: [ delta := tt @ 0 ].
			side == #left ifTrue: [ delta := tt @ 0 ].
			side == #top ifTrue: [ delta := 0 @ tt ].
			side == #bottom ifTrue: [ delta := 0 @ tt ].
			
			callback value: aShape value: side value.
			aShape translateBy: delta ]
]

{ #category : #accessing }
RTCollision >> callback: aTwoArgBlock [
	"evaluate aTwoArgBlock in case of a collision"
	"The first argument is the Trachel shape that has collided with the elementToCheckForCollision
	The second element is the side on which the collision occurs. It could be #top, #bottom, #right, #left"
	callback := aTwoArgBlock
]

{ #category : #initialization }
RTCollision >> checkCollistionFor: aTrachelShape [
	^ elementToCheckForCollision anySatisfy: [ :e | e encompassingRectangle intersects: aTrachelShape encompassingRectangle ]
]

{ #category : #accessing }
RTCollision >> elementToCheckForCollision [
	^ elementToCheckForCollision
]

{ #category : #accessing }
RTCollision >> elementToCheckForCollision: someElements [
	elementToCheckForCollision := someElements
]

{ #category : #initialization }
RTCollision >> initialize [
	super initialize.
	self callback: [ :aShape :aSide | ]
]

{ #category : #initialization }
RTCollision >> initializeElement: element [
	element trachelShape
		addCallback:
			(TRTranslationCallback new
				block:
					[ :aShape :step | self avoidOverlapWith: aShape step: step ])
]
