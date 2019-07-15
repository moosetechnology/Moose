"
This observer records notifications from XMLAttributeLists.
"
Class {
	#name : #XMLRecordingAttributeListObserver,
	#superclass : #XMLRecordingListObserver,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #notifying }
XMLRecordingAttributeListObserver >> addedAttribute: anAttribute [
	self messageRecorder
		recordMessageReceiver: self
		selector: #addedAttribute:
		arguments: (Array with: anAttribute)
]

{ #category : #notifying }
XMLRecordingAttributeListObserver >> removedAttribute: anAttribute [
	self messageRecorder
		recordMessageReceiver: self
		selector: #removedAttribute:
		arguments: (Array with: anAttribute)
]
