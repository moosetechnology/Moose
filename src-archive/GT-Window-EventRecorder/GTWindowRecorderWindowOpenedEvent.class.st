"
I represent the action when a window is opened.

Corresponding window announcement:
WindowOpened
"
Class {
	#name : #GTWindowRecorderWindowOpenedEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #testing }
GTWindowRecorderWindowOpenedEvent >> isWindowOpened [
	^ true
]
