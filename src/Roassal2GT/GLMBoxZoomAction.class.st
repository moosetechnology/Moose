Class {
	#name : #GLMBoxZoomAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #accessing }
GLMBoxZoomAction >> category [
	^ 'Interactions...'
]

{ #category : #hooks }
GLMBoxZoomAction >> execute [
	| int |
	int := RTZoomableBoxView new.
	self roassalView @ int.
]

{ #category : #hooks }
GLMBoxZoomAction >> title [
	^ 'Add RTZoomableBoxView'
]
