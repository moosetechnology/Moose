"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalBooleanVector,
	#superclass : #MalVector,
	#instVars : [
		'bits',
		'size'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'logical operations' }
MalBooleanVector >> & booleanVector [
	
	[self size = booleanVector size] assert.
	^(self class new: self size)
		setBits: (self getBits bitAnd: booleanVector getBits);
		yourself
]

{ #category : #accessing }
MalBooleanVector >> at: index [
	
	^bits allMask: (1 bitShift: index - 1)
]

{ #category : #accessing }
MalBooleanVector >> at: index put: boolean [
	
	^boolean
		ifTrue: [bits := bits maskSet: 1 << (index - 1)]
		ifFalse: [bits := bits maskClear: 1 << (index - 1)]
]

{ #category : #private }
MalBooleanVector >> bits [
	
	^bits
]

{ #category : #private }
MalBooleanVector >> getBits [
	
	^bits
]

{ #category : #'initialize-release' }
MalBooleanVector >> initializeSize: aSize [
	
	bits := 0.
	size := aSize
]

{ #category : #'logical operations' }
MalBooleanVector >> not [
	
	^(self class new: self size)
		setBits: self getBits bitInvert;
		yourself
]

{ #category : #private }
MalBooleanVector >> setBits: integer [
	
	^bits := integer
]

{ #category : #accessing }
MalBooleanVector >> size [
	
	^size
]

{ #category : #'logical operations' }
MalBooleanVector >> | booleanVector [
	
	[self size = booleanVector size] assert.
	^(self class new: self size)
		setBits: (self getBits bitOr: booleanVector getBits);
		yourself
]
