Class {
	#name : #GLMAddScrollbarAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #accessing }
GLMAddScrollbarAction >> category [
	^ 'Interactions...'
]

{ #category : #hooks }
GLMAddScrollbarAction >> execute [
	self roassalView @ RTDoubleScrollBar.
	self roassalUpdate
]

{ #category : #hooks }
GLMAddScrollbarAction >> title [
	^ 'Add scrollbars'
]
