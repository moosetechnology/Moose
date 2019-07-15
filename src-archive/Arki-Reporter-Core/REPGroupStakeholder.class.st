Class {
	#name : #REPGroupStakeholder,
	#superclass : #REPStakeholder,
	#instVars : [
		'stakeholders'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #'instance creation' }
REPGroupStakeholder class >> with: aStakeholder with: anotherStakeholder [
	^ self new
		addAll: (OrderedCollection with: aStakeholder with: anotherStakeholder);
		yourself
]

{ #category : #accessing }
REPGroupStakeholder >> addAll: aCollection [
	self stakeholders addAll: aCollection
]

{ #category : #accessing }
REPGroupStakeholder >> asString [
	^ ', ' join: (stakeholders collect: [:each | each asString])
]

{ #category : #accessing }
REPGroupStakeholder >> asStrings [
	^ stakeholders flatCollect: [:each | each asStrings]
]

{ #category : #initialize }
REPGroupStakeholder >> initialize [ 
	stakeholders := OrderedCollection new
]

{ #category : #accessing }
REPGroupStakeholder >> stakeholders [
	^ stakeholders
]

{ #category : #accessing }
REPGroupStakeholder >> stakeholders: anObject [
	stakeholders := anObject
]
