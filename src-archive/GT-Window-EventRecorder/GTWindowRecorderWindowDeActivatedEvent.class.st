"
I represent the action when a window is deactivated.

Corresponding window announcement:
WindowDeActivated
"
Class {
	#name : #GTWindowRecorderWindowDeActivatedEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #testing }
GTWindowRecorderWindowDeActivatedEvent >> isWindowDeActivated [
	^ true
]
