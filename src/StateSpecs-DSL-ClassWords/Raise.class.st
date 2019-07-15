"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Raise,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Raise class >> error [
	^self exception: (Kind of: Error)
]

{ #category : #'specs creation' }
Raise class >> exception: aClass [ 
	^SpecOfBlockFailure requiredFailure: aClass
]
