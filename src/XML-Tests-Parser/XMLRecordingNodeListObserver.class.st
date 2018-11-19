"
This observer records notifications from XMLNodeLists.
"
Class {
	#name : #XMLRecordingNodeListObserver,
	#superclass : #XMLRecordingListObserver,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #notifying }
XMLRecordingNodeListObserver >> addedNode: aNode [
	self messageRecorder
		recordMessageReceiver: self
		selector: #addedNode:
		arguments: (Array with: aNode)
]

{ #category : #notifying }
XMLRecordingNodeListObserver >> removedNode: aNode [
	self messageRecorder
		recordMessageReceiver: self
		selector: #removedNode:
		arguments: (Array with: aNode)
]
