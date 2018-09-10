Class {
	#name : #TRResizeCanvasEvent,
	#superclass : #TREvent,
	#instVars : [
		'newExtent',
		'oldExtent'
	],
	#category : #'Trachel-Events'
}

{ #category : #accessing }
TRResizeCanvasEvent >> newExtent [
	^ newExtent
]

{ #category : #accessing }
TRResizeCanvasEvent >> newExtent: aPoint [
	newExtent := aPoint
]

{ #category : #accessing }
TRResizeCanvasEvent >> oldExtent [
	^ oldExtent
]

{ #category : #accessing }
TRResizeCanvasEvent >> oldExtent: aPoint [
	oldExtent := aPoint
]
