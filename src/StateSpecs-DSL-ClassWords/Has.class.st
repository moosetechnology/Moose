"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Has,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Has class >> emptyItems [
	^SpecOfCollectionSize requiredSize: 0
]

{ #category : #'specs creation' }
Has class >> size: aNumber [ 
	^SpecOfCollectionSize requiredSize: aNumber
]
