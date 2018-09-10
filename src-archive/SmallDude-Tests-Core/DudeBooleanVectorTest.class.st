Class {
	#name : #DudeBooleanVectorTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #testing }
DudeBooleanVectorTest >> testAccessing [ 
	 
	| array | 
	array := DudeBooleanVector new: 10. 
	array at: 1 put: true. 
	self assert: (array at: 1) == true. 
	self assert: (array at: 2) == false. 
	self assert: (array at: 4) == false. 
	self assert: (array at: 7) == false. 
	self assert: (array at: 10) == false
]

{ #category : #testing }
DudeBooleanVectorTest >> testSearch4OneFragmentsOfSize1AtMiddleOfTheArray [
	| array starts ends |
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	array := DudeBooleanVector new: 10.
	array at: 7 put: true.
	array
		withContinuos: true
		fragmentsOfMinSize: 1
		do: [ :start :end | 
			starts addLast: start.
			ends addLast: end ].
	self assert: starts size equals: 1.
	self assert: (starts at: 1) equals: 7.
	self assert: (ends at: 1) equals: 7
]

{ #category : #testing }
DudeBooleanVectorTest >> testSearch4OneFragmentsOfSize1AtTheEndOfTheArray [
	| array starts ends |
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	array := DudeBooleanVector new: 10.
	array at: 10 put: true.
	array
		withContinuos: true
		fragmentsOfMinSize: 1
		do: [ :start :end | 
			starts addLast: start.
			ends addLast: end ].
	self assert: starts size equals: 1.
	self assert: (starts at: 1) equals: 10.
	self assert: (ends at: 1) equals: 10
]

{ #category : #testing }
DudeBooleanVectorTest >> testSearch4OneFragmentsOfSize1AtTheStartOfTheArray [
	| array starts ends |
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	array := DudeBooleanVector new: 10.
	array at: 1 put: true.
	array
		withContinuos: true
		fragmentsOfMinSize: 1
		do: [ :start :end | 
			starts addLast: start.
			ends addLast: end ].
	self assert: starts size equals: 1.
	self assert: (starts at: 1) equals: 1.
	self assert: (ends at: 1) equals: 1
]

{ #category : #testing }
DudeBooleanVectorTest >> testSearch4OneFragmentsOfSize4AtMiddleOfTheArray [
	| array starts ends |
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	array := DudeBooleanVector new: 10.
	array at: 3 put: true.
	array at: 4 put: true.
	array at: 5 put: true.
	array at: 6 put: true.
	array
		withContinuos: true
		fragmentsOfMinSize: 1
		do: [ :start :end | 
			starts addLast: start.
			ends addLast: end ].
	self assert: starts size equals: 1.
	self assert: (starts at: 1) equals: 3.
	self assert: (ends at: 1) equals: 6
]

{ #category : #testing }
DudeBooleanVectorTest >> testSearch4OneFragmentsOfSize4AtTheEndOfTheArray [
	| array starts ends |
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	array := DudeBooleanVector new: 10.
	array at: 7 put: true.
	array at: 8 put: true.
	array at: 9 put: true.
	array at: 10 put: true.
	array
		withContinuos: true
		fragmentsOfMinSize: 1
		do: [ :start :end | 
			starts addLast: start.
			ends addLast: end ].
	self assert: starts size equals: 1.
	self assert: (starts at: 1) equals: 7.
	self assert: (ends at: 1) equals: 10
]

{ #category : #testing }
DudeBooleanVectorTest >> testSearch4OneFragmentsOfSize4AtTheStartOfTheArray [
	| array starts ends |
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	array := DudeBooleanVector new: 10.
	array at: 1 put: true.
	array at: 2 put: true.
	array at: 3 put: true.
	array at: 4 put: true.
	array
		withContinuos: true
		fragmentsOfMinSize: 1
		do: [ :start :end | 
			starts addLast: start.
			ends addLast: end ].
	self assert: starts size equals: 1.
	self assert: (starts at: 1) equals: 1.
	self assert: (ends at: 1) equals: 4
]

{ #category : #testing }
DudeBooleanVectorTest >> testSearch4TwoFragmentsOfSize4WithMinSize3 [
	| array starts ends |
	starts := OrderedCollection new.
	ends := OrderedCollection new.
	array := DudeBooleanVector new: 16.
	array at: 1 put: true.
	array at: 2 put: true.
	array at: 3 put: true.
	array at: 4 put: true.
	array at: 6 put: true.
	array at: 7 put: true.
	array at: 8 put: true.
	array at: 9 put: true.
	array at: 11 put: true.
	array at: 12 put: true.
	array
		withContinuos: true
		fragmentsOfMinSize: 3
		do: [ :start :end | 
			starts addLast: start.
			ends addLast: end ].
	self assert: starts size equals: 2.
	self assert: (starts at: 1) equals: 1.
	self assert: (ends at: 1) equals: 4.
	self assert: (starts at: 2) equals: 6.
	self assert: (ends at: 2) equals: 9
]

{ #category : #testing }
DudeBooleanVectorTest >> testSize [ 
	 
	| array | 
	array := DudeBooleanVector new: 10. 
	self assert: array size == 10
]
