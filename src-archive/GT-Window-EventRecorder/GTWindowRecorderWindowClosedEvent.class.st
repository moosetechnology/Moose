"
I represent the action when a window is closed.

Corresponding window announcement:
WindowClosed
"
Class {
	#name : #GTWindowRecorderWindowClosedEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #testing }
GTWindowRecorderWindowClosedEvent >> isWindowClosed [
	^ true
]
