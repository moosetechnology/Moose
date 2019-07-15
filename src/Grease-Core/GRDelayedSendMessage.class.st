"
GRDelayedSendMessage is an abstract base for objects that provide currying functionality for GRDelayedSend
"
Class {
	#name : #GRDelayedSendMessage,
	#superclass : #GRObject,
	#instVars : [
		'selector'
	],
	#category : #'Grease-Core-Utilities'
}

{ #category : #'instance creation' }
GRDelayedSendMessage class >> new [
	^ self selector: #yourself
]

{ #category : #'instance creation' }
GRDelayedSendMessage class >> selector: aSymbol [
	^ self basicNew
		initializeWithSelector: aSymbol;
		yourself
]

{ #category : #delegation }
GRDelayedSendMessage >> argumentCount [
	"Answer the number of arguments that must be provided when sending this message."
	
	self subclassResponsibility
]

{ #category : #private }
GRDelayedSendMessage >> basicPerformFor: receiver withArguments: anArray [
	^ anArray size = selector numArgs
		ifTrue: [ receiver perform: selector withArguments: anArray ]
		ifFalse: [ self invalidArgumentCount ]
]

{ #category : #initialization }
GRDelayedSendMessage >> initializeWithSelector: aSymbol [
	self initialize.
	selector := aSymbol
]

{ #category : #private }
GRDelayedSendMessage >> invalidArgumentCount [
	GRInvalidArgumentCount signal
]

{ #category : #private }
GRDelayedSendMessage >> mergeArguments: anArray [
	self subclassResponsibility
]

{ #category : #printing }
GRDelayedSendMessage >> printOn: aStream [
	aStream nextPutAll: 'selector: '; print: selector
]

{ #category : #delegation }
GRDelayedSendMessage >> valueFor: receiver withArguments: anArray [
	"Send the message to receiver with the arguments in anArray. Answer the result.
	Signal an error if the number of arguments does not match the selector."
	
	^ self basicPerformFor: receiver withArguments: (self mergeArguments: anArray)
]

{ #category : #delegation }
GRDelayedSendMessage >> valueFor: receiver withPossibleArguments: anArray [
	"Send the message to receiver with as many of the arguments in anArray as possible. Answer the result.
	Error if not enough arguments are available for the selector."

	| allArguments |
	allArguments := self mergeArguments: anArray.
	
	^ allArguments size < selector numArgs
		ifTrue: [ self invalidArgumentCount ]
		ifFalse: [ self basicPerformFor: receiver withArguments: (allArguments first: selector numArgs) ]
]
