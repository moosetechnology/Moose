Class {
	#name : #ASEllipse,
	#superclass : #ASShape,
	#instVars : [
		'rx',
		'ry',
		'cx',
		'cy'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASEllipse >> cx: aString [ 
"cx = <coordinate>
The x-axis coordinate of the center of the circle.
If the attribute is not specified, the effect is as if a value of '0'  were specified."

	cx := self translateLength: aString
]

{ #category : #'as yet unclassified' }
ASEllipse >> cy: aString [ 

"cy = <coordinate>
The y-axis coordinate of the center of the circle.
If the attribute is not specified, the effect is as if a value of 0 were specified. Animatable: yes."

	cy := self translateLength: aString
]

{ #category : #'as yet unclassified' }
ASEllipse >> rx: aString [ 

	rx := self translateLength: aString.
	

]

{ #category : #'as yet unclassified' }
ASEllipse >> ry: aString [ 

	ry := self translateLength: aString.
	

]

{ #category : #'as yet unclassified' }
ASEllipse >> setShapeOn: aCanvas [
	| circle |
	

	circle := aCanvas createPath: [:builder |
		builder 
			absolute;
			moveTo: (cx - rx @ cy);
			cwArcTo: (cx + rx @ cy )  angle: 180 degreesToRadians;
			cwArcTo: (cx - rx @ cy)  angle: 180 degreesToRadians
		].

	aCanvas setShape: circle.

]
