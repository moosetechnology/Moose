"
I represent the action when a window is labelled.

Corresponding window announcement:
WindowLabelled
"
Class {
	#name : #GTWindowRecorderWindowLabelledEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #initialization }
GTWindowRecorderWindowLabelledEvent >> fromAnnouncement: anAnnouncement [
	
	super fromAnnouncement: anAnnouncement.
	self infoAt: #newLabel putHashForText: anAnnouncement label.
]

{ #category : #testing }
GTWindowRecorderWindowLabelledEvent >> isWindowLabelled [
	^ true
]

{ #category : #accessing }
GTWindowRecorderWindowLabelledEvent >> newLabel [

	^ self infoAt: #newLabel
]
