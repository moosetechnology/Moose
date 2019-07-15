"
I follow the linear function
"
Class {
	#name : #RTScaleLinear,
	#superclass : #RTScale,
	#instVars : [
		'clamp',
		'output',
		'input'
	],
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #accessing }
RTScaleLinear >> clamp: x [
	"If clamp is specified, enables or disables clamping accordingly. If clamping is disabled and the scale is passed a value outside the domain, the scale may return a value outside the range through extrapolation. If clamping is enabled, the return value of the scale is always within the scale’s range."
	clamp := x.
	self rescale.
]

{ #category : #accessing }
RTScaleLinear >> domain: x [
	super domain: x.
	self rescale.
]

{ #category : #initialization }
RTScaleLinear >> initialize [
	super initialize.
	domain := #(0 1).
	range := #(0 1).
	clamp := false.
	interpolate := RTInterpolator.
	self rescale.
]

{ #category : #transformations }
RTScaleLinear >> invert: y [
	^ input scale: y
]

{ #category : #accessing }
RTScaleLinear >> range: r [
	super range: r.
	self rescale.
]

{ #category : #hooks }
RTScaleLinear >> rescale [
	| linear |
	linear := (domain size min: range size ) > 2
		ifTrue: [ RTScalePolylinear ]
		ifFalse: [ RTScaleBilinear ].
	uninterpolate := clamp
		ifTrue: [ RTUninterpolateClamp ]
		ifFalse: [ RTUninterpolateNumber ].
	output := linear new domain: domain; range: range; 
		uninterpolate: uninterpolate; interpolate: interpolate.
	output rescale.
	input := linear new domain: range; range: domain;
		uninterpolate: uninterpolate; interpolate: RTInterpolator.
	input rescale.
]

{ #category : #accessing }
RTScaleLinear >> scale: x [
	^ output scale: x.
]
