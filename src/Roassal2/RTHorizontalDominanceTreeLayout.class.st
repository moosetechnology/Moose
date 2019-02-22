Class {
	#name : #RTHorizontalDominanceTreeLayout,
	#superclass : #RTAbstractHorizontalTreeLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #'hook-private' }
RTHorizontalDominanceTreeLayout >> computeChildrenFor: aNode [
	^ self childrenWithHighestNestingLevelFor: aNode
]
