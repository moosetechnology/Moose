"
I represent the action when a window is collapsed.

Corresponding window announcement:
WindowCollapsed
"
Class {
	#name : #GTWindowRecorderWindowCollapsedEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #testing }
GTWindowRecorderWindowCollapsedEvent >> isWindowCollapsed [
	^ true
]
