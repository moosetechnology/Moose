"
A GRDelayedSend is a future message send of a message to an object. Some of the arguments can be predefined. Instances are intended to be interchangeable with blocks.

This class should conform the ANSI (block) valuable protocol. Unlike a block, a GRDelayedSend is not a closure so doesn't hold onto the method context. GRDelayedSend provides similar, but portable, functionality to Pharo's MessageSend.

This is an abstract class. Use the methods in the 'instance-creation' protocol on the class side to create intances.

Instance Variables
	receiver:		<Object>
	selector:		<Symbol>

receiver
	- the object receiving the message

selector
	- the message selector sent to the receiver

"
Class {
	#name : #GRDelayedSend,
	#superclass : #GRObject,
	#instVars : [
		'receiver',
		'message'
	],
	#category : #'Grease-Core-Utilities'
}

{ #category : #'instance creation' }
GRDelayedSend class >> empty [
	^ self receiver: nil selector: #yourself
]

{ #category : #'instance creation' }
GRDelayedSend class >> new [
	^ self empty
]

{ #category : #'instance creation' }
GRDelayedSend class >> receiver: anObject selector: aSymbol [ 
	^ self basicNew 
		initializeWithReceiver: anObject
			message: (GRUnboundMessage selector: aSymbol);
		yourself
]

{ #category : #'instance creation' }
GRDelayedSend class >> receiver: anObject selector: aSymbol argument: aParameter [
	^ self receiver: anObject selector: aSymbol arguments: (Array with: aParameter)
]

{ #category : #'instance creation' }
GRDelayedSend class >> receiver: anObject selector: aSymbol arguments: anArray [ 
	^ self basicNew 
		initializeWithReceiver: anObject
			message: (GRBoundMessage selector: aSymbol arguments: anArray);
		yourself
]

{ #category : #accessing }
GRDelayedSend >> argumentCount [
	"Answer the number of arguments that must be provided to the receiver when sending it."
	
	^ message argumentCount
]

{ #category : #accessing }
GRDelayedSend >> fixCallbackTemps [
	"For polymorphism with BlockContext>>#fixCallbackTemps."
]

{ #category : #initialization }
GRDelayedSend >> initializeWithReceiver: anObject message: aDelayedSendMessage [
	self initialize.
	receiver := anObject.
	message := aDelayedSendMessage
]

{ #category : #printing }
GRDelayedSend >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' receiver: '; print: receiver.
	aStream nextPut: $ .
	message printOn: aStream
]

{ #category : #evaluating }
GRDelayedSend >> value [
	^ self valueWithArguments: #()
]

{ #category : #evaluating }
GRDelayedSend >> value: anObject [
	^ self valueWithArguments: (Array with: anObject)
]

{ #category : #evaluating }
GRDelayedSend >> value: aFirstObject value: aSecondObject [
	^ self valueWithArguments: (Array with: aFirstObject with: aSecondObject)
]

{ #category : #evaluating }
GRDelayedSend >> valueWithArguments: anArray [
	^ message valueFor: receiver withArguments: anArray
]

{ #category : #evaluating }
GRDelayedSend >> valueWithPossibleArguments: anArray [
	^ message valueFor: receiver withPossibleArguments: anArray
]
