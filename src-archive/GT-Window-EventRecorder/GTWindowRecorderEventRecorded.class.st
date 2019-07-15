"
I am an event that is sent after a window action was recorded.
"
Class {
	#name : #GTWindowRecorderEventRecorded,
	#superclass : #Announcement,
	#instVars : [
		'recordedEvent'
	],
	#category : #'GT-Window-EventRecorder-Base'
}

{ #category : #'instance creation' }
GTWindowRecorderEventRecorded class >> forEvent: aRecorderEvent [
	^ self new
		recordedEvent: aRecorderEvent;
		yourself.
]

{ #category : #accessing }
GTWindowRecorderEventRecorded >> recordedEvent [
	^ recordedEvent
]

{ #category : #accessing }
GTWindowRecorderEventRecorded >> recordedEvent: aRecorderEvent [
	recordedEvent := aRecorderEvent
]
