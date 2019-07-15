"
A delayed send that has none of the arguments defined in advance.
"
Class {
	#name : #GRUnboundMessage,
	#superclass : #GRDelayedSendMessage,
	#category : #'Grease-Core-Utilities'
}

{ #category : #delegation }
GRUnboundMessage >> argumentCount [
	^ selector numArgs
]

{ #category : #private }
GRUnboundMessage >> mergeArguments: anArray [
	^ anArray
]
