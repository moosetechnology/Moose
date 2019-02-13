Class {
	#name : #TRClipBoxShape,
	#superclass : #TRBoxShape,
	#instVars : [
		'edges',
		'useColor',
		'condition'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #accessing }
TRClipBoxShape >> condition: aBlockWith2Args [
	condition := aBlockWith2Args
]

{ #category : #drawing }
TRClipBoxShape >> drawOn: athensCanvas [
	|rec c |
	self shouldBeDrawn
		ifFalse: [ ^ self ].
	rec := self encompassingRectangle.
	edges do: [ :ed |
		(condition value: rec value: ed) ifTrue: [ 
			c := ed color.
			(useColor and: [strokePaint isNil not]) ifTrue: [ ed color: strokePaint ].
			ed trachelShape
				canvas: self canvas;
				drawOn: athensCanvas;
				canvas: nil;
				color: c ] ].
	super drawOn: athensCanvas.
]

{ #category : #accessing }
TRClipBoxShape >> edges: ed [
	edges := ed.
]

{ #category : #initialization }
TRClipBoxShape >> initialize [
	super initialize.
	self condition: [ :rec :ed | true ].
	self useColor: true.
]

{ #category : #accessing }
TRClipBoxShape >> useColor: aBool [
	useColor := aBool
	
]
