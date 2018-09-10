"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Identical,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Identical class >> to: anObject [ 
	^SpecOfIdentity requiredValue: anObject
]
