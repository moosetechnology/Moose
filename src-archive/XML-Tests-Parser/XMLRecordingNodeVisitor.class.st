"
This node visitor records vititing messages sent by node accept methods using an XMLMessageRecorder.
"
Class {
	#name : #XMLRecordingNodeVisitor,
	#superclass : #XMLNodeVisitor,
	#instVars : [
		'messageRecorder'
	],
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLRecordingNodeVisitor >> messageRecorder [
	^ messageRecorder ifNil: [messageRecorder := XMLMessageRecorder new]
]

{ #category : #visiting }
XMLRecordingNodeVisitor >> visitCData: aCData [
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitCData:
		argument: aCData.

	^ super visitCData: aCData.
]

{ #category : #visiting }
XMLRecordingNodeVisitor >> visitComment: aComment [
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitComment:
		argument: aComment.

	^ super visitComment: aComment.
]

{ #category : #visiting }
XMLRecordingNodeVisitor >> visitDocument: aDocument [
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitDocument:
		argument: aDocument.

	^ super visitDocument: aDocument.
]

{ #category : #visiting }
XMLRecordingNodeVisitor >> visitElement: anElement [
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitElement:
		argument: anElement.

	^ super visitElement: anElement.
]

{ #category : #visiting }
XMLRecordingNodeVisitor >> visitNodeWithElements: aNodeWithElements [
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitNodeWithElements:
		argument: aNodeWithElements.

	^ super visitNodeWithElements: aNodeWithElements.
]

{ #category : #visiting }
XMLRecordingNodeVisitor >> visitPI: aPI [
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitPI:
		argument: aPI.

	^ super visitPI: aPI.
]

{ #category : #visiting }
XMLRecordingNodeVisitor >> visitStringNode: aStringNode [
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitStringNode:
		argument: aStringNode.

	^ super visitStringNode: aStringNode.
]
