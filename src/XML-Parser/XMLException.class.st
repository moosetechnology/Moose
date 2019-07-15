"
A generic exception class that supports message formatting. Used as a base class for exceptions in XMLParser and related packages like XPath.
"
Class {
	#name : #XMLException,
	#superclass : #Error,
	#category : #'XML-Parser-Exceptions'
}

{ #category : #signalling }
XMLException class >> formatSignal: aString with: aFirstValue [
	^ self new
		formatSignal: aString
		with: aFirstValue
]

{ #category : #signalling }
XMLException class >> formatSignal: aString with: aFirstValue with: aSecondValue [
	^ self new
		formatSignal: aString
		with: aFirstValue
		with: aSecondValue
]

{ #category : #signalling }
XMLException class >> formatSignal: aString with: aFirstValue with: aSecondValue with: aThirdValue [
	^ self new
		formatSignal: aString
		with: aFirstValue
		with: aSecondValue
		with: aThirdValue
]

{ #category : #signalling }
XMLException class >> formatSignal: aString with: aFirstValue with: aSecondValue with: aThirdValue with: aFourthValue [
	^ self new
		formatSignal: aString
		with: aFirstValue
		with: aSecondValue
		with: aThirdValue
		with: aFourthValue
]

{ #category : #signalling }
XMLException class >> formatSignal: aString withArguments: anArray [
	^ self new
		formatSignal: aString
		withArguments: anArray
]

{ #category : #signalling }
XMLException class >> signalMessageFrom: anException [
	^ self new signalMessageFrom: anException
]

{ #category : #accessing }
XMLException >> formatMessage: aString with: aFirstValue [
	self
		formatMessage: aString
		withArguments: (Array with: aFirstValue)
]

{ #category : #accessing }
XMLException >> formatMessage: aString with: aFirstValue with: aSecondValue [
	self
		formatMessage: aString
		withArguments:
			(Array
				with: aFirstValue
				with: aSecondValue)
]

{ #category : #accessing }
XMLException >> formatMessage: aString with: aFirstValue with: aSecondValue with: aThirdValue [
	self
		formatMessage: aString
		withArguments:
			(Array
				with: aFirstValue
				with: aSecondValue
				with: aThirdValue)
]

{ #category : #accessing }
XMLException >> formatMessage: aString with: aFirstValue with: aSecondValue with: aThirdValue with: aFourthValue [
	self
		formatMessage: aString
		withArguments:
			(Array
				with: aFirstValue
				with: aSecondValue
				with: aThirdValue
				with: aFourthValue)
]

{ #category : #accessing }
XMLException >> formatMessage: aString withArguments: anArray [
	self messageText: (aString format: anArray)
]

{ #category : #signaling }
XMLException >> formatSignal: aString with: aFirstValue [
	self
		formatMessage: aString
		with: aFirstValue.
	^ self signal.
]

{ #category : #signaling }
XMLException >> formatSignal: aString with: aFirstValue with: aSecondValue [
	self
		formatMessage: aString
		with: aFirstValue
		with: aSecondValue.
	^ self signal.
]

{ #category : #signaling }
XMLException >> formatSignal: aString with: aFirstValue with: aSecondValue with: aThirdValue [
	self
		formatMessage: aString
		with: aFirstValue
		with: aSecondValue
		with: aThirdValue.
	^ self signal.
]

{ #category : #signaling }
XMLException >> formatSignal: aString with: aFirstValue with: aSecondValue with: aThirdValue with: aFourthValue [
	self
		formatMessage: aString
		with: aFirstValue
		with: aSecondValue
		with: aThirdValue
		with: aFourthValue.
	^ self signal.
]

{ #category : #signaling }
XMLException >> formatSignal: aString withArguments: anArray [
	self
		formatMessage: aString
		withArguments: anArray.
	^ self signal.
]

{ #category : #accessing }
XMLException >> inheritMessageFrom: anException [
	self
		formatMessage: '({1}) {2}'
		with: anException class name
		with: anException messageText
]

{ #category : #signaling }
XMLException >> signalMessageFrom: anException [
	self inheritMessageFrom: anException.
	^  self signal.
]
