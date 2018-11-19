"
This handler records the results of testing messages from within handlers.
"
Class {
	#name : #SAXTestingMessageRecordingHandler,
	#superclass : #SAXRecordingHandler,
	#instVars : [
		'isInContentResults',
		'isInCDataSectionResults',
		'hasParserResults'
	],
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
SAXTestingMessageRecordingHandler >> hasParserResults [
	^ hasParserResults ifNil: [hasParserResults := OrderedCollection new]
]

{ #category : #accessing }
SAXTestingMessageRecordingHandler >> isInCDataSectionResults [
	^ isInCDataSectionResults ifNil: [isInCDataSectionResults := OrderedCollection new]
]

{ #category : #accessing }
SAXTestingMessageRecordingHandler >> isInContentResults [
	^ isInContentResults ifNil: [isInContentResults := OrderedCollection new]
]

{ #category : #recording }
SAXTestingMessageRecordingHandler >> recordMessage: aMessage [
	self recordTestingMessages.
	super recordMessage: aMessage.
]

{ #category : #recording }
SAXTestingMessageRecordingHandler >> recordMessageReceiver: anObject selector: aSelector [
	self recordTestingMessages.
	super
		recordMessageReceiver: anObject
		selector: aSelector.
]

{ #category : #recording }
SAXTestingMessageRecordingHandler >> recordMessageReceiver: anObject selector: aSelector argument: anArgument [
	self recordTestingMessages.
	super
		recordMessageReceiver: anObject
		selector: aSelector
		argument: anArgument.
]

{ #category : #recording }
SAXTestingMessageRecordingHandler >> recordMessageReceiver: anObject selector: aSelector arguments: aSequenceableCollection [
	self recordTestingMessages.
	super
		recordMessageReceiver: anObject
		selector: aSelector
		arguments: aSequenceableCollection.
]

{ #category : #recording }
SAXTestingMessageRecordingHandler >> recordTestingMessages [
	self hasParserResults addLast: self hasParser.
	self isInCDataSectionResults addLast: self isInCDataSection.
	self isInContentResults addLast: self isInContent.
]
