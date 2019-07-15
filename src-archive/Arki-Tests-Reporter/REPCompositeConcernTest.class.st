Class {
	#name : #REPCompositeConcernTest,
	#superclass : #TestCase,
	#category : #'Arki-Tests-Reporter'
}

{ #category : #'as yet unclassified' }
REPCompositeConcernTest >> testStatusBackpointer [
	| spec |
	spec := REPConcernSpecification on: #().
	spec composite: 'composite' meaning: 'something' with: [ 
		spec query: 'success1' meaning: '' as: [:input | #()].
		spec query: 'success2' meaning: '' as: [:input | #()]. 
	].
	self assert: spec root children first status concern = spec root children first
]
