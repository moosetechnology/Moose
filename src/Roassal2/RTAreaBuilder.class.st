"
A builder for SVG shapes. in area with data.
"
Class {
	#name : #RTAreaBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'shape',
		'dataBlock',
		'data',
		'x0',
		'x1',
		'y0',
		'y1',
		'defined',
		'interpolate',
		'interpolateReverse',
		'lvar',
		'tension'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #public }
RTAreaBuilder >> data: aCollection [
	data := aCollection
]

{ #category : #public }
RTAreaBuilder >> dataBlock: ablock [
	"ablock should return an array of objects(in the best case an array of points)"
	dataBlock := ablock
]

{ #category : #public }
RTAreaBuilder >> defined: aBlock [
	defined := aBlock
]

{ #category : #initialization }
RTAreaBuilder >> initialize [
	super initialize.
	self x: #x.
	y0 := 0.
	y1 := #y.
	defined := true.
	tension := 0.7.
	lvar := 'L'.
	self interpolator: RTLinearPathBuilder new.
	self shape shape: RTSVGPath new.
	self shape path: [ :e | self pathFor: e ].
	dataBlock := #yourself
]

{ #category : #public }
RTAreaBuilder >> interpolator: anObject [
	interpolate := anObject.
	interpolateReverse := (anObject isKindOf: RTLinePathBuilder ) 
		ifTrue: [ 
			lvar := interpolate closed 
				ifTrue: [ 'M' ] 
				ifFalse: ['L'].
			 interpolate reverse. ]
		ifFalse: [ interpolate ].
	
]

{ #category : #'computed accessing' }
RTAreaBuilder >> pathFor: element [
	| segments points0 points1 n datapoints d x y fx0 fy0 fx1 fy1 segment |
	datapoints := dataBlock rtValue: element model.
	n := datapoints size.
	segments :=OrderedCollection new.
	points0 := OrderedCollection new.
	points1 := OrderedCollection new.
	fx0 := x0.
	fy0 := y0.
	x := y := nil.
	fx1 := x0 == x1 ifTrue: [ [ x ] ] ifFalse: [ x1 ].
	fy1 := y0 == y1 ifTrue: [ [ y ] ] ifFalse: [ y1 ].
	segment := [ 
		segments 
			add: 'M'; 
			add: (interpolate rtValue: (points1->tension) );
			add: lvar;
			add: (interpolateReverse rtValue: (points0 reverse -> tension));
			add: 'Z'. ].
	
	1 to: n do: [ :i | 
		d := datapoints at: i.
		(defined rtValue: d) 
			ifTrue: [ 
				x := fx0 rtValue: d.
				y := fy0 rtValue: d.
				points0 add: x@y.
				points1 add: (fx1 rtValue: d)@ (fy1 rtValue: d) ] 
			ifFalse: [ 
				points0 ifNotEmpty: [ 
					segment value.
					points0 := OrderedCollection new.
					points1 := OrderedCollection new. ] ]
		].
	points0 ifNotEmpty: [ segment value. ].
	^ segments inject: ''  into: [ :str :s | str, s ].
]

{ #category : #hooks }
RTAreaBuilder >> renderIn: aView [
	| elements |
	elements := self shape elementsOn: data.
	aView addAll: elements.
	self interaction setUpElements: elements
]

{ #category : #'as yet unclassified' }
RTAreaBuilder >> rtValue: e [
	^ self pathFor: e
]

{ #category : #public }
RTAreaBuilder >> x0: aBlock [
	x0 := aBlock
]

{ #category : #public }
RTAreaBuilder >> x1: aBlock [
	x1 := aBlock
]

{ #category : #public }
RTAreaBuilder >> x: aBlock [
	x0 := x1 := aBlock
]

{ #category : #public }
RTAreaBuilder >> y0: aBlock [
	y0 := aBlock
]

{ #category : #public }
RTAreaBuilder >> y1: aBlock [
	y1 := aBlock
]

{ #category : #public }
RTAreaBuilder >> y: aBlock [
	y0 := y1 := aBlock
]
