Class {
	#name : #GLMInspectViewAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMInspectViewAction >> execute [
	self roassalView inspect
]

{ #category : #hooks }
GLMInspectViewAction >> title [
	^ 'Inspect View'
]
