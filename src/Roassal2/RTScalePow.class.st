"
I scale using pow function
"
Class {
	#name : #RTScalePow,
	#superclass : #RTScaleLinear,
	#instVars : [
		'exponent',
		'powp',
		'powb',
		'linear'
	],
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #accessing }
RTScalePow >> clamp: x [
	linear clamp: x
]

{ #category : #accessing }
RTScalePow >> domain: x [
	linear domain: ((domain := x) collect: [ :i | powp scale: i ]).
]

{ #category : #accessing }
RTScalePow >> exponent [
	^ exponent
]

{ #category : #accessing }
RTScalePow >> exponent: x [
	exponent := x.
	powp exponent: exponent.
	powb exponent: 1/exponent.
	linear domain: (domain collect: [ :i | powp scale: i ])
]

{ #category : #initialization }
RTScalePow >> initialize [
	super initialize.
	linear := self class linear.
	exponent := 1.
	domain := #(0 1).
	powp := RTScalePowPow exponent: exponent.
	powb := RTScalePowPow exponent: 1 / exponent.
]

{ #category : #accessing }
RTScalePow >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
RTScalePow >> interpolate: x [
	linear interpolate: x
]

{ #category : #transformations }
RTScalePow >> invert: x [
	^ powb scale: (linear invert: x)
]

{ #category : #accessing }
RTScalePow >> range [
	^ linear range
]

{ #category : #accessing }
RTScalePow >> range: x [
	linear range: x
]

{ #category : #hooks }
RTScalePow >> rescale [
]

{ #category : #accessing }
RTScalePow >> scale: x [
	^ linear scale: (powp scale: x)
]
