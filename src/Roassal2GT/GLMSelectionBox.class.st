Class {
	#name : #GLMSelectionBox,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #accessing }
GLMSelectionBox >> category [
	^ 'Interactions...'
]

{ #category : #hooks }
GLMSelectionBox >> execute [
	| int |
	int := RTSelectionBox new.
	self roassalView @ int.
]

{ #category : #hooks }
GLMSelectionBox >> title [
	^ 'Add RTSelectionBox'
]
