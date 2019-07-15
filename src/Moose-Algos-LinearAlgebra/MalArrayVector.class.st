"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalArrayVector,
	#superclass : #MalVector,
	#type : #variable,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalArrayVector class >> new: size [
	
	^self basicNew: size
]

{ #category : #accessing }
MalArrayVector >> at: index [
	
	^self basicAt: index
]

{ #category : #accessing }
MalArrayVector >> at: index put: aNumber [
	
	^self basicAt: index put: aNumber
]

{ #category : #accessing }
MalArrayVector >> size [
	
	^self basicSize
]
