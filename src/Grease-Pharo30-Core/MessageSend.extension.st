Extension { #name : #MessageSend }

{ #category : #'*Grease-Pharo30-Core' }
MessageSend >> argumentCount [
	^ selector numArgs - self arguments size
]

{ #category : #'*Grease-Pharo30-Core' }
MessageSend >> fixCallbackTemps [
	"for polymorphism with BlockContext >> #fixCallbackTemps"
]

{ #category : #'*Grease-Pharo30-Core' }
MessageSend >> valueWithPossibleArguments: anArray [
	"Evaluate the block represented by the receiver.
     If the block requires one argument, use anArg, if it requires more than one,
     fill up the rest with nils."

	^ self valueWithEnoughArguments: anArray
]
