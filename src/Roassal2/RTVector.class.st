"
I am a class to represent a simple vector and their functions
"
Class {
	#name : #RTVector,
	#superclass : #RTObject,
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #'instance creation' }
RTVector class >> x: x y: y z: z [
	self new
		x: x;
		y: y;
		z: z.
]

{ #category : #arithmetic }
RTVector >> - w [
	| inst |
	inst := RTVector new.
	inst x: x - w x y: y - w y z: z - w z.
	^ inst
]

{ #category : #computing }
RTVector >> add: rhs [
	x := x + rhs x.
	y := y + rhs y.
	z := z + rhs z.
]

{ #category : #computing }
RTVector >> cross: w [
	|inst |
	inst := RTVector new.
	inst
		x: (y * w z) - (z * w y);
		y: (z * w x) - (x * w z);
		z: (x * w y) - (y * w x).
	^ inst
]

{ #category : #computing }
RTVector >> dot: w [
	^ (x * w x) + (y * w y) + (z * w z)
]

{ #category : #initialization }
RTVector >> initialize [
	super initialize.
	x := 0.
	y := 0.
	z := 0.
]

{ #category : #computing }
RTVector >> isZero [
	^ ((x = 0) and: [ y = 0 ]) and: [ z = 0 ].
]

{ #category : #computing }
RTVector >> lengthenBy: val [
	| mag |
	mag := self magnitude.
	self scaleBy: ((mag + val)/ mag)
]

{ #category : #computing }
RTVector >> magnitude [
	^ ( (x * x) + (y * y) + (z * z) ) sqrt
]

{ #category : #computing }
RTVector >> normalize [
	| mag |
	mag := self magnitude.
	mag = 0 ifTrue: [ ^ mag ].
	x := x / mag.
	y := y / mag.
	z := z / mag.
	^ mag.
]

{ #category : #computing }
RTVector >> normalize: length [
	self normalize.
	self scaleBy: length
]

{ #category : #computing }
RTVector >> rotate: axis angle: angle [
	| n |
	n := RTVector new x: axis x y: axis y z: axis z.
	n normalize.
	n scaleBy: (n dot: self).
	n add: ((self - n) scaleBy: angle cos ).
	n add: ((n cross: self) scaleBy: angle sin).
	^ n.
]

{ #category : #computing }
RTVector >> scaleBy: factor [
	x := x * factor.
	y := y * factor.
	z := z * factor.
]

{ #category : #computing }
RTVector >> shortenBy: val [
	self lengthenBy: val negated
]

{ #category : #accessing }
RTVector >> x [
	^ x
]

{ #category : #accessing }
RTVector >> x: cx [
	x := cx.
]

{ #category : #accessing }
RTVector >> x: cx y: cy [
	x := cx.
	y := cy
]

{ #category : #accessing }
RTVector >> x: cx y: cy z: cz [
	x := cx.
	y := cy.
	z := cz
]

{ #category : #accessing }
RTVector >> y [
	^ y
]

{ #category : #accessing }
RTVector >> y: cy [
	y := cy
]

{ #category : #accessing }
RTVector >> z [
	^ z
]

{ #category : #accessing }
RTVector >> z: cz [
	z := cz
]
