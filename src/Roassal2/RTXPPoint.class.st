"
I am an point with an offset
"
Class {
	#name : #RTXPPoint,
	#superclass : #RTObject,
	#instVars : [
		'x',
		'y',
		'y0'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #'initialize-release' }
RTXPPoint class >> x: x y: y y0: y1 [
	^ self new x: x; y: y; y0: y1
]

{ #category : #accessing }
RTXPPoint >> x [
	^ x
]

{ #category : #accessing }
RTXPPoint >> x: aNumber [
	x := aNumber
]

{ #category : #accessing }
RTXPPoint >> y [
	^ y 
]

{ #category : #accessing }
RTXPPoint >> y0 [
	^ y0
]

{ #category : #accessing }
RTXPPoint >> y0: aNumber [
	y0 := aNumber
]

{ #category : #accessing }
RTXPPoint >> y: aNumber [
	y := aNumber
]
