"
I represent the action when a window is activated.

Corresponding window announcement:
WindowActivated
"
Class {
	#name : #GTWindowRecorderWindowActivatedEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #testing }
GTWindowRecorderWindowActivatedEvent >> isWindowActivated [
	^ true
]
