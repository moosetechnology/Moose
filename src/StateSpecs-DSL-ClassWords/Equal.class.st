"
I am DSL word for better syntax for specs creation sentences.

Look at class side
"
Class {
	#name : #Equal,
	#superclass : #SpecOfDSLClassWords,
	#category : 'StateSpecs-DSL-ClassWords'
}

{ #category : #'specs creation' }
Equal class >> inSameOrderTo: anObject [ 
	^SpecOfCollectionOrderedEquality requiredValue: anObject
]

{ #category : #'specs creation' }
Equal class >> to: anObject [ 
	^SpecOfEquality requiredValue: anObject
]

{ #category : #'specs creation' }
Equal class >> to: aNumber within: accuracyNumber [ 
	^SpecOfApproxEquality to: aNumber within: accuracyNumber 
]
