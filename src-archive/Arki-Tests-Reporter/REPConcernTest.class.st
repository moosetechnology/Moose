Class {
	#name : #REPConcernTest,
	#superclass : #TestCase,
	#category : #'Arki-Tests-Reporter'
}

{ #category : #'as yet unclassified' }
REPConcernTest >> testAnnouncer [
	| concern |
	concern := REPConcern new .
	self assert: concern announcer == concern announcer
]

{ #category : #'as yet unclassified' }
REPConcernTest >> testDefaultStatus [
	self assert: REPComputedConcern new status notNil.
	self assert: REPComputedConcern new status color = Color black.
	self assert: REPComputedConcern new status label notNil
]

{ #category : #'as yet unclassified' }
REPConcernTest >> testDefaults [
	self assert: REPConcern new label = 'REP Concern'.
	self assert: REPConcern new explanation = 'REP Concern'
]
