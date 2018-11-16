"
SmaCCStringIndex is used to index into a SmaCCString. When you perform an insert operation into a SmaCCString, you get a SmaCCStringIndex back so you can index into the newly inserted string.

Instance Variables:
	index	<Integer>	the index in the SmaCCInterval
	intervalId	<Integer>	the SmaCCInterval's id


"
Class {
	#name : #SmaCCStringIndex,
	#superclass : #Magnitude,
	#instVars : [
		'index',
		'intervalId'
	],
	#category : #'SmaCC_Source_Editing'
}

{ #category : #'instance creation' }
SmaCCStringIndex class >> index: anInteger intervalId: intervalId [
	^ self new
		index: anInteger;
		intervalId: intervalId;
		yourself
]

{ #category : #arithmetic }
SmaCCStringIndex >> + anInteger [
	^ self class index: index + anInteger intervalId: intervalId
]

{ #category : #arithmetic }
SmaCCStringIndex >> - anInteger [
	^ self + anInteger negated
]

{ #category : #comparing }
SmaCCStringIndex >> < aSmaCCStringIndex [
	^ self index < aSmaCCStringIndex index
]

{ #category : #comparing }
SmaCCStringIndex >> = anObject [
	^ self class = anObject class
		and:
			[ self index = anObject index
				and: [ self intervalId = anObject intervalId ] ]
]

{ #category : #comparing }
SmaCCStringIndex >> hash [
	^ index bitXor: intervalId
]

{ #category : #accessing }
SmaCCStringIndex >> index [
	^ index
]

{ #category : #accessing }
SmaCCStringIndex >> index: anInteger [
	index := anInteger
]

{ #category : #accessing }
SmaCCStringIndex >> intervalId [
	^ intervalId
]

{ #category : #accessing }
SmaCCStringIndex >> intervalId: anInteger [
	intervalId := anInteger
]

{ #category : #printing }
SmaCCStringIndex >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: intervalId;
		nextPut: $,;
		print: index;
		nextPut: $)
]
