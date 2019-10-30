"
Description
--------------------

I am a simple slot unique to Moose.

For now, I do nothing specific except annotationg the variable with the fact that the variable is a Fame property.
"
Class {
	#name : #FMProperty,
	#superclass : #InstanceVariableSlot,
	#category : #'Fame-Core-Utilities'
}

{ #category : #testing }
FMProperty >> isFameSlot [
	^ true
]
