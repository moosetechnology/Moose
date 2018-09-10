"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Instance,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Instance class >> of: aClass [ 
	^SpecOfObjectClass requiredClass: aClass
]
