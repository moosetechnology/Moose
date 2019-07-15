Class {
	#name : #ASLine,
	#superclass : #ASShape,
	#instVars : [
		'x1',
		'y1',
		'x2',
		'y2'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASLine >> setShapeOn: aCanvas [
	| path |
	
	path := aCanvas createPath: [:builder |
		builder 
			absolute;
			moveTo: x1@y1;
			lineTo: x2@y2.
	].
	
	aCanvas setShape: path.

]

{ #category : #'as yet unclassified' }
ASLine >> x1: aString [ 
	x1 := self translateLength: aString
]

{ #category : #'as yet unclassified' }
ASLine >> x2: aString [ 
	x2 := self translateLength: aString
]

{ #category : #'as yet unclassified' }
ASLine >> y1: aString [ 
	y1 := self translateLength: aString
]

{ #category : #'as yet unclassified' }
ASLine >> y2: aString [ 
	y2 := self translateLength: aString
]
