"
I am a simple to expand boxes from a simple view using the mouse in that interaction.
"
Class {
	#name : #RTFisheye,
	#superclass : #RTInteraction,
	#instVars : [
		'radius',
		'distortion',
		'k1',
		'k0',
		'focus',
		'position',
		'view'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #'as yet unclassified' }
RTFisheye class >> radius: anObject [
	^ self new radius: anObject.
]

{ #category : #accessing }
RTFisheye >> distortion [
	^ distortion
]

{ #category : #accessing }
RTFisheye >> distortion: anObject [
	distortion := anObject.
	self rescale.
]

{ #category : #accessing }
RTFisheye >> focus [
	^ focus.
]

{ #category : #accessing }
RTFisheye >> focus: anObject [
	focus := anObject.
]

{ #category : #initialization }
RTFisheye >> initialize [
	super initialize.
	radius := 200.
	distortion := 2.
	k0 := k1 := nil.
	focus := 0@0.
	position := #position.
	self rescale.
]

{ #category : #hooks }
RTFisheye >> initializeElement: aView [
	view := aView.
	self position: [ :e | e attributes at: #position ].
	view when: TRMouseMove do: [ :evt |
		self focus: evt position.
		view elements do: [ :e | | fisheye |
			(e attributes includesKey: #position) 
				ifFalse: [ e attributes at: #position put: e position ].
			fisheye := self scale: e.
			e attributes at: #fisheye put: fisheye.
			e translateTo:  fisheye x@ fisheye y.
			e trachelShape class = TREllipseShape
				ifTrue: [ e trachelShape extent: (fisheye y0 * 9) asPoint ].
			]. 
		view signalUpdate ].
	
	
]

{ #category : #accessing }
RTFisheye >> position [
	^ position
]

{ #category : #accessing }
RTFisheye >> position: anObject [
	position := anObject.
]

{ #category : #accessing }
RTFisheye >> radius [
	^ radius
]

{ #category : #accessing }
RTFisheye >> radius: anObject [
	radius := anObject.
	self rescale.
]

{ #category : #hooks }
RTFisheye >> rescale [
	k0 := distortion exp.
	k0 := k0 / (k0 - 1) * radius.
	k1 := distortion / radius.

]

{ #category : #accessing }
RTFisheye >> scale: anObject [
	| d dx dy dd k |
	d := position rtValue: anObject.
	dx := d x - focus x.
	dy := d y - focus y.
	dd := ((dx * dx) + (dy * dy)) sqrt.
	dd >= radius ifTrue: [ ^ RTXPPoint x: d x y: d y y0: 1 ].
	
	k := (k0 * (1 - ( dd negated * k1) exp ) / dd * 0.75) + 0.25.
	^ RTXPPoint 
		x: focus x + (dx*k) 
		y: focus y + (dy*k)
		y0: (k min: 10)
        


]
