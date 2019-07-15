"
A ROTreeLayout is xxxxxxxxx.

"
Class {
	#name : #RTTreeLayout,
	#superclass : #RTAbstractVerticalTreeLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #'hook-private' }
RTTreeLayout >> computeChildrenFor: aNode [
	^ self childrenFor: aNode except: alreadyLayoutedNodes
]
