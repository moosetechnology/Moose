"
Records sent formatter messages in a queue for testing.
"
Class {
	#name : #XMLWriterRecordingFormatterProxy,
	#superclass : #Object,
	#instVars : [
		'messageQueue'
	],
	#category : #'XML-Writer-Tests'
}

{ #category : #'reflective operations' }
XMLWriterRecordingFormatterProxy >> doesNotUnderstand: aMessage [
	(XMLWriterFormatter whichCategoryIncludesSelector: aMessage selector) = #formatting
		ifTrue: [messageQueue addLast: aMessage]
]

{ #category : #initialization }
XMLWriterRecordingFormatterProxy >> initialize [
	super initialize.
	messageQueue := OrderedCollection new.
]

{ #category : #testing }
XMLWriterRecordingFormatterProxy >> receivedNext: aSelector with: anArgument [
	^ self
		receivedNextAll: (Array with: aSelector)
		with: anArgument
]

{ #category : #testing }
XMLWriterRecordingFormatterProxy >> receivedNextAll: aNameCollection with: anArgument [
	aNameCollection do: [:each | | message |
		(messageQueue notEmpty
			and: [(message := messageQueue first) selector == each asSymbol
				and: [message arguments asArray = (Array with: anArgument)]])
			ifFalse: [^ false].
		messageQueue removeFirst].
	^ true.
]
