"
I am NeoCSVTestObject.
"
Class {
	#name : #NeoCSVTestObject,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : 'Neo-CSV-Tests'
}

{ #category : #'instance creation' }
NeoCSVTestObject class >> example [
	^ self x: 100 y: 200 z: 300
]

{ #category : #'instance creation' }
NeoCSVTestObject class >> x: x y: y z: z [
	^ self new
		x: x;
		y: y;
		z: z;
		yourself
]

{ #category : #comparing }
NeoCSVTestObject >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ x = anObject x
		and: [
			y = anObject y
				and: [
					z = anObject z ] ]
]

{ #category : #comparing }
NeoCSVTestObject >> hash [
	^ x hash bitXor: (y hash bitXor: z)
]

{ #category : #accessing }
NeoCSVTestObject >> x [
	^ x
]

{ #category : #accessing }
NeoCSVTestObject >> x: anObject [
	x := anObject
]

{ #category : #accessing }
NeoCSVTestObject >> y [
	^ y
]

{ #category : #accessing }
NeoCSVTestObject >> y: anObject [
	y := anObject
]

{ #category : #accessing }
NeoCSVTestObject >> z [
	^ z
]

{ #category : #accessing }
NeoCSVTestObject >> z: anObject [
	z := anObject
]
