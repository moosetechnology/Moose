"
This observer records notifications using an XMLMessageRecorder.
"
Class {
	#name : #XMLRecordingListObserver,
	#superclass : #Object,
	#instVars : [
		'messageRecorder'
	],
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #notifying }
XMLRecordingListObserver >> added: anObject to: aList [
	self messageRecorder
		recordMessageReceiver: self
		selector: #added:to:
		arguments: (Array with: anObject with: aList)
]

{ #category : #accesing }
XMLRecordingListObserver >> clearNotifications [
	self messageRecorder clearMessages
]

{ #category : #testing }
XMLRecordingListObserver >> hasNotifications [
	^ self messageRecorder hasMessages
]

{ #category : #accesing }
XMLRecordingListObserver >> messageRecorder [
	^ messageRecorder ifNil: [messageRecorder := XMLMessageRecorder new]
]

{ #category : #accesing }
XMLRecordingListObserver >> nextNotification [
	^ self messageRecorder nextMessage
]

{ #category : #notifying }
XMLRecordingListObserver >> removed: anObject from: aList [
	self messageRecorder
		recordMessageReceiver: self
		selector: #removed:from:
		arguments: (Array with: anObject with: aList)
]
