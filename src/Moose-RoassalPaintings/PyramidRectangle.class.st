Class {
	#name : #PyramidRectangle,
	#superclass : #Object,
	#instVars : [
		'color',
		'textColor',
		'text',
		'calculation',
		'popup'
	],
	#category : #'Moose-RoassalPaintings-OverviewPyramid'
}

{ #category : #defaults }
PyramidRectangle class >> paleYellow [
	^ self new
		color: Color paleYellow;
		yourself
]

{ #category : #defaults }
PyramidRectangle class >> white [
	^ self new
		color: Color white;
		yourself
]

{ #category : #'as yet unclassified' }
PyramidRectangle >> backgroundColor [
	color ifNil: [ ^Color white ].
	^ color value
]

{ #category : #accessing }
PyramidRectangle >> calculation [
	^ calculation
]

{ #category : #accessing }
PyramidRectangle >> calculation: anObject [
	calculation := anObject
]

{ #category : #accessing }
PyramidRectangle >> color [
	^ color
]

{ #category : #accessing }
PyramidRectangle >> color: anObject [
	color := anObject
]

{ #category : #accessing }
PyramidRectangle >> label [
	text ifNil: [ 
		calculation ifNil: [ ^'' ] 
		ifNotNil: [^calculation value asString]]
	ifNotNil: [ ^text ]
]

{ #category : #accessing }
PyramidRectangle >> popup [
	^ popup
]

{ #category : #accessing }
PyramidRectangle >> popup: anObject [
	popup := anObject
]

{ #category : #'as yet unclassified' }
PyramidRectangle >> popupText [
	popup ifNil: [ ^'' ].
	^popup
]

{ #category : #'as yet unclassified' }
PyramidRectangle >> printString [
	popup ifNil: [ ^super printString].
	^popup
]

{ #category : #accessing }
PyramidRectangle >> text [
	^ text
]

{ #category : #accessing }
PyramidRectangle >> text: anObject [
	text := anObject
]

{ #category : #accessing }
PyramidRectangle >> textColor [
	^ textColor ifNil: [ Color black ]
]

{ #category : #accessing }
PyramidRectangle >> textColor: anObject [
	textColor := anObject
]
