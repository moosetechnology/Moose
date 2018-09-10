"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalFloatVector,
	#superclass : #MalVector,
	#type : #variable,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalFloatVector class >> new: size [
	
	^self basicNew: size "<< 2"
]

{ #category : #accessing }
MalFloatVector >> at: anIndex [
	
	"^self floatAt: (anIndex bitShift: 2) - 3"
	^ (self basicAt: anIndex) 
]

{ #category : #accessing }
MalFloatVector >> at: anIndex put: aNumber [
	
	"^self
		floatAt: (anIndex bitShift: 2) - 3
		put: aNumber asFloat"
		
	^ self basicAt: anIndex put: aNumber asFloat
]

{ #category : #private }
MalFloatVector >> floatAt: byteIndex [
	
	<primitive: 548>
	^self primitiveFailed

]

{ #category : #private }
MalFloatVector >> floatAt: byteIndex put: float [
	
	<primitive: 549>
	^self primitiveFailed
	

]

{ #category : #accessing }
MalFloatVector >> size [
	
	^self basicSize" >> 2"
]
