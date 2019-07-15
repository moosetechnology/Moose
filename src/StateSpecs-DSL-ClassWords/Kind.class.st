"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Kind,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Kind class >> of: aClass [ 
	^SpecOfObjectSuperclass requiredClass: aClass
]
