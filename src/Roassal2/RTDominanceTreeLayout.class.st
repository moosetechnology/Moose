Class {
	#name : #RTDominanceTreeLayout,
	#superclass : #RTAbstractVerticalTreeLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #'hook-private' }
RTDominanceTreeLayout >> computeChildrenFor: aNode [
	^ self childrenWithHighestNestingLevelFor: aNode
]
