Class {
	#name : #ASPolygon,
	#superclass : #ASShape,
	#instVars : [
		'points'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASPolygon >> points: aString [ 

	"parse polygon points"
	| pts x y conv stream |
	
	points := OrderedCollection new.
	stream := aString readStream.
	
	conv := ASConverter new stream: stream.

	[ stream atEnd ] whileFalse: [
		conv skipBlanks.
		x := conv nextNumber.
		x ifNil: [ ^ self ].
		
		conv skipBlanks.
		stream peek = $, ifFalse: [ ^ self].
		stream next.
		conv skipBlanks.
		y := conv nextNumber.
		y ifNil: [ ^ self ].
		
		points add: (x@y)
		
	].

	^ points
	
]

{ #category : #'as yet unclassified' }
ASPolygon >> setShapeOn: aCanvas [
	| path |

	path := aCanvas createPath: [:builder |
		builder 
			absolute;
			moveTo: points first.		

		points allButFirstDo: [:pt | builder lineTo: pt ].
		
		builder close
	].
	
	aCanvas setShape: path.

]
