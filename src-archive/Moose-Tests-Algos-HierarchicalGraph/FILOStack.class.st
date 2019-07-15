Class {
	#name : #FILOStack,
	#superclass : #Stack,
	#category : #'Moose-Tests-Algos-HierarchicalGraph'
}

{ #category : #adding }
FILOStack >> push: anObject [
 	self addLast: anObject.
 	^ anObject.
]
