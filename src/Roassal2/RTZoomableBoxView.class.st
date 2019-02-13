"
I am a class that allows you to use a elastic box in a View, this box is a tool that allows you to zoom in or zoom out in a view.
"
Class {
	#name : #RTZoomableBoxView,
	#superclass : #RTAbstractElasticBoxInteraction,
	#instVars : [
		'color'
	],
	#category : #'Roassal2-Selection'
}

{ #category : #initialization }
RTZoomableBoxView >> initialize [
	super initialize.
	self allowNegatedBox: false.
	self when: RTSelectionEnd do: [:e| self updateScale: e. ].
]

{ #category : #initialization }
RTZoomableBoxView >> updateScale: evt [
	| s r sc |
	s := evt shape.
	(s extent x <= 0 or: [ s extent y <= 0 ])
		ifTrue: [ view canvas focusOnCenterScaled ]
		ifFalse: [ 
			r := s encompassingRectangle.
			(r extent x isZero or: [ r extent y isZero ]) ifTrue: [ ^ self ].
			sc := (view canvas extent * 0.9) / r extent.
			sc := (sc x < sc y) ifTrue: [sc x] ifFalse: [ sc y ].
			view canvas camera 
				translateTo: r center;
				scale: sc ].
	view signalUpdate.
]
