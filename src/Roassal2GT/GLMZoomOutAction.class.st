Class {
	#name : #GLMZoomOutAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMZoomOutAction >> execute [
	RTZoomOutMove on: self roassalView
]

{ #category : #hooks }
GLMZoomOutAction >> icon [
	^ GLMUIThemeExtraIcons glamorousZoomOut
]

{ #category : #hooks }
GLMZoomOutAction >> order [
	^ 5
]

{ #category : #hooks }
GLMZoomOutAction >> title [
	^ 'Zoom in'
]
