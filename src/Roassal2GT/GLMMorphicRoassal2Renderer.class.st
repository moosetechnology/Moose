"
A GLMMorphicRoassalRenderer is xxxxxxxxx.

Instance Variables
	myMorph:		<Object>

myMorph
	- xxxxx

"
Class {
	#name : #GLMMorphicRoassal2Renderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'myMorph'
	],
	#category : #'Roassal2GT-Glamour'
}

{ #category : #rendering }
GLMMorphicRoassal2Renderer >> actOnPresentationUpdate: ann [
	| aView canvas |
	aView := ann presentation newViewBlock value.
	ann presentation renderOn: aView.
	canvas := aView view setUpCanvas.
	myMorph 
		canvas: canvas;
		extent: canvas extent.
		
]

{ #category : #rendering }
GLMMorphicRoassal2Renderer >> render: aRoassalPresentation [
	| view |
	view := aRoassalPresentation view.
	aRoassalPresentation renderOn: view.
	aRoassalPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdate: to: self.
	^ myMorph := view view setUpCanvas buildMorph
]
