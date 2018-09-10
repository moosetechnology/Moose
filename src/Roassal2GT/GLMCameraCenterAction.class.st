Class {
	#name : #GLMCameraCenterAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMCameraCenterAction >> execute [
	self trachelCanvas focusOnCenterScaled.
	self roassalUpdate
]

{ #category : #hooks }
GLMCameraCenterAction >> icon [
	^ GLMUIThemeExtraIcons glamorousZoomToFit
]

{ #category : #hooks }
GLMCameraCenterAction >> order [
	^ 6
]

{ #category : #hooks }
GLMCameraCenterAction >> title [
	^ 'Camera center'
]
