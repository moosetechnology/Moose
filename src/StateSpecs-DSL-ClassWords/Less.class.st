"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Less,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Less class >> orEqualThan: anObject [
	^SpecOfLesserMagnitude strong: false pattern: anObject 
]

{ #category : #'specs creation' }
Less class >> than: anObject [
	^SpecOfLesserMagnitude than: anObject strong: true
]
