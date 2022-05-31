"
Utility class for OverviewPyramid.
I provide RSShapes or RSComposites.
"
Class {
	#name : #PyramidBrickFactory,
	#superclass : #Object,
	#instVars : [
		'shape',
		'label'
	],
	#category : #'Famix-Visualizations-Overview-Pyramid'
}

{ #category : #'instance creation' }
PyramidBrickFactory class >> coupling [
	^ self new
		color: Color lightMagenta;
		yourself
]

{ #category : #accessing }
PyramidBrickFactory class >> defaultExtent [

	^ 60 @ 20
]

{ #category : #'instance creation' }
PyramidBrickFactory class >> empty [
	^ self new
		color: Color white;
		yourself
]

{ #category : #'instance creation' }
PyramidBrickFactory class >> inheritance [
	^ self new
		color: Color paleGreen;
		yourself
]

{ #category : #'instance creation' }
PyramidBrickFactory class >> sizeAndComplexity [
	^ self new
		color: Color lightYellow;
		yourself
]

{ #category : #accessing }
PyramidBrickFactory >> brick [
	label text ifEmpty: [ ^ shape ].
	^ RSComposite new
		addAll:
			{shape.
			label};
		extent: shape extent;
		yourself
]

{ #category : #accessing }
PyramidBrickFactory >> color: aColor [

	shape color: aColor
]

{ #category : #initialization }
PyramidBrickFactory >> initialize [
	super initialize.

	shape := RSBox new
		extent: self class defaultExtent;
		yourself.

	label := RSLabel new
		text: '';
		yourself
]

{ #category : #accessing }
PyramidBrickFactory >> popup: aString [

	shape popupText: aString
]

{ #category : #accessing }
PyramidBrickFactory >> text: aString [

	label text: aString
]

{ #category : #accessing }
PyramidBrickFactory >> textColor: aColor [

	label color: aColor
]
