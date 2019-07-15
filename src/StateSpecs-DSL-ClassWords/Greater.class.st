"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Greater,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Greater class >> orEqualThan: anObject [
	^SpecOfGreaterMagnitude strong: false pattern: anObject 
]

{ #category : #'specs creation' }
Greater class >> than: anObject [
	^SpecOfGreaterMagnitude than: anObject strong: true
]
