"
A Comparison bundles two entities to be compared in a SimilarityMatrix.
"
Class {
	#name : #RTComparison,
	#superclass : #Object,
	#instVars : [
		'lhs',
		'rhs',
		'similarity'
	],
	#category : #'Roassal2-Builder-SimilarityMatrix'
}

{ #category : #'as yet unclassified' }
RTComparison class >> of: anObject with: anotherObject by: similarityBlock [
	^ self new of: anObject with: anotherObject by: similarityBlock
]

{ #category : #accessing }
RTComparison >> lhs [
	^ lhs
]

{ #category : #'initialize-release' }
RTComparison >> of: anObject with: anotherObject by: similarityBlock [
	"similarityBlock should take two arguments and return a float in the range [0,1]"
	lhs := anObject.
	rhs := anotherObject.
	similarity := similarityBlock value: lhs value: rhs.
	self
		assert: ((0 <= similarity) & (similarity <= 1))
		descriptionBlock: ['Expected similarity in range [0,1], got ', similarity printString]
]

{ #category : #accessing }
RTComparison >> rhs [
	^ rhs
]

{ #category : #accessing }
RTComparison >> similarity [
	^ similarity
]
