Class {
	#name : #ASCircle,
	#superclass : #ASShape,
	#instVars : [
		'r',
		'cx',
		'cy'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASCircle >> cx: aString [ 
"cx = <coordinate>
The x-axis coordinate of the center of the circle.
If the attribute is not specified, the effect is as if a value of '0'  were specified."

	cx := self translateLength: aString
]

{ #category : #'as yet unclassified' }
ASCircle >> cy: aString [ 

"cy = <coordinate>
The y-axis coordinate of the center of the circle.
If the attribute is not specified, the effect is as if a value of 0 were specified. Animatable: yes."

	cy := self translateLength: aString
]

{ #category : #'as yet unclassified' }
ASCircle >> initialize [ 
	super initialize.
	
	cx := cy := 0.
]

{ #category : #'as yet unclassified' }
ASCircle >> r: aString [ 

"r = <length>
The radius of the circle.
A negative value is an error (see Error processing). A value of zero disables rendering of the element.
Animatable: yes.
"

	r := self translateLength: aString.
	

]

{ #category : #'as yet unclassified' }
ASCircle >> setShapeOn: aCanvas [
	| circle |

	circle := aCanvas createPath: [:builder |
		builder 
			absolute;
			moveTo: (cx - r @ cy);
			cwArcTo: (cx + r @ cy )  angle: 180 degreesToRadians;
			cwArcTo: (cx - r @ cy)  angle: 180 degreesToRadians
		].

	aCanvas setShape: circle.

]
