Class {
	#name : #REPCustomQueryConcern,
	#superclass : #REPMooseQueryConcern,
	#instVars : [
		'stakeholder',
		'computation',
		'label',
		'explanation'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPCustomQueryConcern >> computation [
	^ computation
]

{ #category : #accessing }
REPCustomQueryConcern >> computation: anObject [
	computation := anObject
]

{ #category : #accessing }
REPCustomQueryConcern >> computeResult [ 
	^ self computation glamourValue: self model asGlamorousMultiValue 
]

{ #category : #accessing }
REPCustomQueryConcern >> explanation [
	^ explanation
]

{ #category : #accessing }
REPCustomQueryConcern >> explanation: anObject [
	explanation := anObject
]

{ #category : #accessing }
REPCustomQueryConcern >> label [
	^ label
]

{ #category : #accessing }
REPCustomQueryConcern >> label: anObject [
	label := anObject
]

{ #category : #accessing }
REPCustomQueryConcern >> stakeholder [
	^ stakeholder ifNil: [REPStakeholder everyone]
]

{ #category : #accessing }
REPCustomQueryConcern >> stakeholder: anObject [
	stakeholder := anObject
]

{ #category : #accessing }
REPCustomQueryConcern >> stakeholderString: aString [
	self stakeholder: (REPStakeholder named: aString)
]
