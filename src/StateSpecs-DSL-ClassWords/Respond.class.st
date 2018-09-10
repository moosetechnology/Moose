"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Respond,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Respond class >> to: aSelector [ 
	^SpecOfObjectResponsibility for: aSelector
]
