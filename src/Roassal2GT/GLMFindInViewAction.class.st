Class {
	#name : #GLMFindInViewAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMFindInViewAction >> execute [
	GTSpotterMorph new
          extent: 400@500;
          spotterModel: (GTSpotter on: self roassalView);
          openCenteredInWorld
]

{ #category : #hooks }
GLMFindInViewAction >> icon [
	^ GLMUIThemeExtraIcons glamorousInspect
]

{ #category : #hooks }
GLMFindInViewAction >> order [
	^ 50
]

{ #category : #hooks }
GLMFindInViewAction >> title [
	^ 'Find'
]
