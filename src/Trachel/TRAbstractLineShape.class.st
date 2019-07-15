Class {
	#name : #TRAbstractLineShape,
	#superclass : #TRShape,
	#instVars : [
		'width'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #testing }
TRAbstractLineShape >> isLineShape [
	^ true
]

{ #category : #accessing }
TRAbstractLineShape >> strokePaint [
	"return the color of the border line"
	^ self color
]

{ #category : #accessing }
TRAbstractLineShape >> strokePaint: aColor [
	"set the color of the border line"
	strokePaint := aColor
]

{ #category : #accessing }
TRAbstractLineShape >> width [
	"Return the width of the line, in pixels"
	^ width
]

{ #category : #accessing }
TRAbstractLineShape >> width: aNumber [
	"Set the width of the line, in pixels"
	width := aNumber
]
