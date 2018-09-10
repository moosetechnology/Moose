Class {
	#name : #ASColorPaint,
	#superclass : #ASPaint,
	#instVars : [
		'color'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASColorPaint >> color: aColor [
	color := aColor
]

{ #category : #'as yet unclassified' }
ASColorPaint >> fill: shape on: aCanvas [

	aCanvas setPaint: (color alpha: (color alpha * shape fill_opacity)).
	
	aCanvas draw
]

{ #category : #'as yet unclassified' }
ASColorPaint >> resolveIds: aDictionary [ 
	^ self 
]

{ #category : #'as yet unclassified' }
ASColorPaint >> stroke: shape on: aCanvas [
	| stroke |
	stroke := aCanvas setStrokePaint: (color alpha: (color alpha * shape stroke_opacity)).
	
	stroke width: shape stroke_width.
	
	aCanvas draw
]
