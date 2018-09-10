"
Signalled when ReadStream>>next encounters a premature end.
"
Class {
	#name : #MalEndOfStream,
	#superclass : #Error,
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #exceptiondescription }
MalEndOfStream >> defaultAction [
	"Answer ReadStream>>next default reply."

	^ nil
]

{ #category : #description }
MalEndOfStream >> isResumable [
	"EndOfStream is resumable, so ReadStream>>next can answer."

	^ true
]
