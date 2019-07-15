"
I am a utility clas for RTScalePow
"
Class {
	#name : #RTScalePowPow,
	#superclass : #RTObject,
	#instVars : [
		'exponent'
	],
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #'instance creation' }
RTScalePowPow class >> exponent: exponent [
	^ self new 
		exponent: exponent;
		yourself
]

{ #category : #accessing }
RTScalePowPow >> exponent [
	^ exponent
]

{ #category : #accessing }
RTScalePowPow >> exponent: aNumber [
	exponent := aNumber
]

{ #category : #transformations }
RTScalePowPow >> scale: x [
	^ x < 0
		ifTrue: [ (x negated raisedTo: exponent) negated ]
		ifFalse: [ x raisedTo: exponent ]
]
