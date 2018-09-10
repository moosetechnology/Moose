Class {
	#name : #ASGradient,
	#superclass : #ASContainerElement,
	#instVars : [
		'stops',
		'gradientTransform',
		'gradientUnits'
	],
	#category : #'Athens-SVG'
}

{ #category : #operations }
ASGradient >> colorRampWithOpacity: aFloat [ 
	
	(stops isNil or: [stops  isEmpty ]) ifTrue: [
		self xlink_href ifNotNil: [:link |
			^ link colorRampWithOpacity: aFloat
			].
		^ #().
		].
	
	^ stops collect: [:ea | ea asRampColorWithOpacity: aFloat]

]

{ #category : #accessing }
ASGradient >> gradientTransform: aString [

	gradientTransform := ASTransformConverter new translateString: aString
]

{ #category : #accessing }
ASGradient >> gradientUnits: aString [ 

	gradientUnits := aString
]

{ #category : #initialize }
ASGradient >> initialize [ 
	super initialize.
	gradientTransform := AthensAffineTransform new.
]

{ #category : #rendering }
ASGradient >> renderOn: aCanvas [
	"do nothing, i'm cannot be rendered directly"
]

{ #category : #operations }
ASGradient >> spreadMethod: aByteString [ 
	"not yet"

]
