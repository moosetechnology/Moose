"
A RTBitmap represents a bitmap shape 

Here is an example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	| v  s trachelShape |
	v := RTView new.

	s := RTBitmap element.
	v add: s.

	trachelShape := s trachelShape.
	trachelShape extent: 180 @ 100.
	trachelShape fillColor: Color blue.

	1 to: 80 do: [ :i |
		trachelShape at: i @ i put: Color green ].

	v open
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTBitmap,
	#superclass : #RTAbstractElementShape,
	#instVars : [
		'form'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTBitmap >> form [
	^ form
]

{ #category : #accessing }
RTBitmap >> form: aValueOrOneArgBlock [
	"aValueOrOneArgBlock takes a model as input"
	self formElement: [ :anElement | aValueOrOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTBitmap >> formElement: aValueOrOneArgBlock [
	"aValueOrOneArgBlock takes a roassal element as input"
	form := aValueOrOneArgBlock
]

{ #category : #hooks }
RTBitmap >> trachelShapeClass [
	^ TRBitmapShape

]

{ #category : #hooks }
RTBitmap >> updateFor: anElement trachelShape: trachelShape [
	| ex |
	trachelShape isNil ifTrue: [ ^ self ].
	
	form isNil ifTrue: [ 
		ex := (self widthFor: anElement) @ (self heightFor: anElement).
		trachelShape extent: ex
	] ifFalse: [ 
		trachelShape form: (self form rtValue: anElement). ].

	trachelShape 
		rotateByDegrees:  (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement)

]
