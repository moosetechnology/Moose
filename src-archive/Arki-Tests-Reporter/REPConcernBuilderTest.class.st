Class {
	#name : #REPConcernBuilderTest,
	#superclass : #TestCase,
	#category : #'Arki-Tests-Reporter'
}

{ #category : #'as yet unclassified' }
REPConcernBuilderTest >> testBasicQueryCreation [
	| spec |
	spec := REPConcernSpecification on: 42.
	spec query: 'Label' meaning: 'Explanation' as: [:x | x + 1].
	self assert: spec root children size = 1.
	self assert: spec root children first label = 'Label'.
	self assert: spec root children first explanation = 'Explanation'.
	self assert: spec root children first model = 42.
	self assert: spec root children first result = 43
]

{ #category : #'as yet unclassified' }
REPConcernBuilderTest >> testComposition [
	| spec |

	spec := REPConcernSpecification on: 42.

	spec composite: 'One' with: [
		spec concern: (REPConcern new)].
	spec composite: 'Two' with: [
		spec concern: (REPConcern new).
		spec concern: (REPConcern new)].

	self assert: spec root children size = 2.
	self assert: spec root children first children size = 1.
	self assert: spec root children last children size = 2.
	self assert: spec root children first label = 'One'

]

{ #category : #'as yet unclassified' }
REPConcernBuilderTest >> testCustomConcern [
	| spec |
	spec := REPConcernSpecification on: 42.
	spec concern: REPConcern new.
	self assert: spec root children first model = 42
]

{ #category : #'as yet unclassified' }
REPConcernBuilderTest >> testErroredQuery [
	| spec |
	spec := REPConcernSpecification on: 42.
	spec query: 'Label' meaning: 'Explanation' as: [:x | 1 // 0].
	self assert: spec root children size = 1.
	self assert: spec root children first label = 'Label'.
	self assert: spec root children first explanation = 'Explanation'.
	self assert: spec root children first model = 42.
	self assert: spec root children first result isNil
]

{ #category : #'as yet unclassified' }
REPConcernBuilderTest >> testRoot [
	self assert: (REPConcernSpecification on: 42) root model = 42
]
