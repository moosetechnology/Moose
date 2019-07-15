"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Satisfying,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Satisfying class >> for: aBlockContext [ 
	^SpecOfObjectStateByPredicate from: aBlockContext
]
