Class {
	#name : #GLMZoomInAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMZoomInAction >> execute [
	RTZoomInMove on: self roassalView
]

{ #category : #hooks }
GLMZoomInAction >> icon [
	^ GLMUIThemeExtraIcons glamorousZoomIn
]

{ #category : #hooks }
GLMZoomInAction >> order [
	^ 1
]

{ #category : #hooks }
GLMZoomInAction >> title [
	^ 'Zoom in'
]
