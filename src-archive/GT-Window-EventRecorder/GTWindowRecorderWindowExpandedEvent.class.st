"
I represent the action when a window is expanded.

Corresponding window announcement:
WindowExpanded
"
Class {
	#name : #GTWindowRecorderWindowExpandedEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #testing }
GTWindowRecorderWindowExpandedEvent >> isWindowExpanded [
	^ true
]
