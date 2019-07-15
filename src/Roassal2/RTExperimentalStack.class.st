"
I am an experimental class.

This is an stack data based in
	http://leebyron.com/streamgraph/stackedgraphs_byron_wattenberg.pdf
"
Class {
	#name : #RTExperimentalStack,
	#superclass : #RTObject,
	#instVars : [
		'values',
		'xblock',
		'yblock',
		'order',
		'offset',
		'stackOffsets',
		'out'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #'as yet unclassified' }
RTExperimentalStack >> expand: data [
	| n m k y0 o |
	n := data size.
	m := data first size.
	k := 1 / n.
	y0 := Array new: m.
	1 to: m do: [ :j | 
		o := 0.
		1 to: n do: [ :i| o:= o + (((data at: i) at: j) y) ].
		o isZero not 
			ifTrue: [ 
				1 to: n do: [:i| | v |
					v := (data at: i) at: j.
					v y: v y / o. ] ]
			ifFalse: [ 
				1 to: n do: [ :i |
					((data at: i) at: j) y: k ] ]
		].
	1 to: m do: [ :j | y0 at: j put: 0 ].
	
	^ y0
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> initialize [
	| zero |
	super initialize.
	values := #yourself.
	xblock := [ :p | p x ].
	yblock := [ :p | p y ].
	order := [ :data | (1 to: data size) asArray ].
	zero := [ :data | (1 to: data first size ) collect: [ :d| 0 ] ].
	offset := zero.
	out := [ :d :y0 | d y0: y0 ].
	stackOffsets := Dictionary new.
	stackOffsets 
		at: #wiggle put: [ :data| self wiggle: data ];
		at: #silhouette put: [ :data| self silhouette: data ];
		at: #expand put: [ :data| self expand: data ];
		at: #zero put: zero.
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> offset: arg [
	offset := arg isBlock 
		ifTrue: [ arg ] 
		ifFalse: [ stackOffsets at: arg ifAbsent: [ 
				offset ] ] .
	
	
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> silhouette: data [
	| n m y0 sums o max|
	n := data size.
	m := data first size.
	y0 := Array new: m.
	sums := OrderedCollection new.
	max := 0.
	1 to: m do: [ :j | 
		o := 0.
		1 to: n do: [ :i | o:= o + (((data at: i) at: j) y) ].
		o > max ifTrue: [ max := o ].
		sums add: o ].
	1 to: m do: [ :j | y0 at: j put: (max - (sums at: j))/2 ].
	^ y0
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> stack: data [
	| series points orders offsets n m o |
	data isNil ifTrue: [ ^ data ].
	(n := data size) isZero ifTrue: [ ^ data ].
	
	series := data collect: values.
	points := series collect: [ :d | | p |
		d collect: [:v | p := RTXPPoint new.
			p x: (xblock rtValue: v).
			p y: (yblock rtValue: v). 
			p. ] ].
	
	orders := order rtValue: points.
	series := orders collect: [ :i | series at: i ].
	points := orders collect: [ :i | points at: i ].
	offsets := offset rtValue: points.
	m := series first size.
	1 to: m do: [ :j | 
		o := offsets at: j.
		out value: (points first at: j) value: o.
		2 to: n do: [ :i | 
			o := o + ((points at: (i -1)) at: j) y.
			out value: ((points at: i) at: j) value: o ]
		 ].
	
	^ points.
	
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> values: anObject [
	values := anObject
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> wiggle: data [
	| n x m s1 s2 s3 dx o o0 y0 |
	n := data size.
	x := data first.
	m := x size.
	y0 := Array new: m.
	y0 at: 1 put: (o := o0 := 0).
	2 to: m do: [ :j | 
		s1 := 0.
		1 to: n do: [ :i | s1 := s1 + ((data at: i) at: j) y ].
		s2 := 0.
		dx := (x at: j) x - (x at: (j-1)) x.

		1 to: n do: [ :i |
			s3 := (((data at: i) at: j) y - ((data at: i) at: (j-1)) y)/ (2*dx).
			1 to: (i-1) do: [ :k | 
				s3 := s3 + 
				( (((data at: k) at: j) y - ((data at: k) at: (j-1)) y )/dx ) ].
			s2 := s2 + (s3 * ((data at: i) at: j) y). ].
		
		y0 at: j put: ( o := s1 isZero ifTrue: [ 0 ] ifFalse: [s2 / s1 * dx ]).
		o < o0 ifTrue: [ o0 := o ].
		].
	
	1 to: m do: [ :j | y0 at: j put: ((y0 at: j)- o0)].
	^ y0.
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> x: anObject [
	xblock := anObject
]

{ #category : #'as yet unclassified' }
RTExperimentalStack >> y: anObject [
	yblock := anObject
]
