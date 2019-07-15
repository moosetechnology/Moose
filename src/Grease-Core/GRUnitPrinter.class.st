Class {
	#name : #GRUnitPrinter,
	#superclass : #GRPrinter,
	#instVars : [
		'integerPrinter',
		'fractionPrinter',
		'units',
		'base'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #'instance creation' }
GRUnitPrinter class >> base: anInteger units: anArray [
	^ self new 
		base: anInteger;
		units: anArray;
		yourself
]

{ #category : #accessing }
GRUnitPrinter >> base: anInteger [
	base := anInteger
]

{ #category : #accessing }
GRUnitPrinter >> fractionPrinter: aPrinter [
	fractionPrinter := aPrinter
]

{ #category : #initialization }
GRUnitPrinter >> initialize [
	super initialize.
	self integerPrinter: (GRNumberPrinter new
		precision: 0;
		yourself).
	self fractionPrinter: (GRNumberPrinter new
		precision: 1;
		yourself)
]

{ #category : #accessing }
GRUnitPrinter >> integerPrinter: aPrinter [
	integerPrinter := aPrinter
]

{ #category : #printing }
GRUnitPrinter >> print: anObject on: aStream [
	anObject = 1
		ifTrue: [ ^ self print: anObject unit: units first on: aStream ].
	units allButFirst
		inject: anObject asFloat
		into: [ :value :each |
			value < base
				ifFalse: [ value / base ]
				ifTrue: [ ^ self print: value unit: each on: aStream ] ]
]

{ #category : #printing }
GRUnitPrinter >> print: aNumber unit: aString on: aStream [
	(units first = aString or: [ units second = aString ])
		ifTrue: [ integerPrinter print: aNumber on: aStream ]
		ifFalse: [ fractionPrinter print: aNumber on: aStream ].
	aStream nextPut: $ ; nextPutAll: aString
]

{ #category : #accessing }
GRUnitPrinter >> units: anArray [
	units := anArray
]
