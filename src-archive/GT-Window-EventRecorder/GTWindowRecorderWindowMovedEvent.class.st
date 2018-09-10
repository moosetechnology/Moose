"
I represent the action when a window is moved.

Corresponding window announcement:
WindowMoved
"
Class {
	#name : #GTWindowRecorderWindowMovedEvent,
	#superclass : #GTWindowRecorderEvent,
	#category : #'GT-Window-EventRecorder-Events'
}

{ #category : #initialization }
GTWindowRecorderWindowMovedEvent >> fromAnnouncement: anAnnouncement [
	
	super fromAnnouncement: anAnnouncement.
	self infoAt: #oldPosition put: anAnnouncement oldPosition.
	self infoAt: #newPosition put: anAnnouncement newPosition.
]

{ #category : #testing }
GTWindowRecorderWindowMovedEvent >> isWindowMoved [
	^ true
]

{ #category : #accessing }
GTWindowRecorderWindowMovedEvent >> newPosition [
	^ self infoAt: #newPosition
]

{ #category : #accessing }
GTWindowRecorderWindowMovedEvent >> oldPosition [
	^ self infoAt: #oldPosition
]
