Class {
	#name : #PyramidRectangleFactory,
	#superclass : #Object,
	#instVars : [
		'shape',
		'label'
	],
	#category : #'Moose-RoassalPaintings-OverviewPyramid'
}

{ #category : #accessing }
PyramidRectangleFactory class >> defaultExtent [

	^ 60 @ 20
]

{ #category : #accessing }
PyramidRectangleFactory >> color: aColor [

	shape color: aColor
]

{ #category : #initialization }
PyramidRectangleFactory >> initialize [
	super initialize.

	shape := RSBox new
		extent: self class defaultExtent;
		yourself.

	label := RSLabel new
		text: '';
		yourself
]

{ #category : #accessing }
PyramidRectangleFactory >> popup: aString [

	shape popupText: aString
]

{ #category : #accessing }
PyramidRectangleFactory >> rectangle [
	label text ifEmpty: [ ^ shape ].
	^ RSComposite new
		addAll:
			{shape.
			label};
		extent: shape extent;
		yourself
]

{ #category : #accessing }
PyramidRectangleFactory >> text: aString [

	label text: aString
]

{ #category : #accessing }
PyramidRectangleFactory >> textColor: aColor [

	label color: aColor
]
