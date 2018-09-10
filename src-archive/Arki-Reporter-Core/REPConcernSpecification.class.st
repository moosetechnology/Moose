Class {
	#name : #REPConcernSpecification,
	#superclass : #Object,
	#instVars : [
		'root',
		'model'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #'instance creation' }
REPConcernSpecification class >> on: aModel [
	^ self new 
			model: aModel;
			yourself
]

{ #category : #'concern building' }
REPConcernSpecification >> composite: aString meaning: anExplanationString with: aBlock [ 
	| state |
	state := self shallowCopy.
	self root: (self concern: ((
		REPCompositeConcern on: self model) 
			label: aString; 
			explanation: anExplanationString;
			yourself)).
	aBlock ensure: [ self copyFrom: state ]
]

{ #category : #'concern building' }
REPConcernSpecification >> composite: aString with: aBlock [ 
	^ self composite: aString meaning: aString with: aBlock
]

{ #category : #'concern building' }
REPConcernSpecification >> concern: aConcern [
	^ self root addChild: (aConcern model: self model; yourself)
]

{ #category : #opening }
REPConcernSpecification >> exportToHudson [
	self root
]

{ #category : #'initialize-release' }
REPConcernSpecification >> initialize [
	root := REPCompositeConcern new label: 'Concerns'
]

{ #category : #accessing }
REPConcernSpecification >> label: aString [ 
	self root label: aString
]

{ #category : #accessing }
REPConcernSpecification >> model [
	^ model
]

{ #category : #accessing }
REPConcernSpecification >> model: anObject [
	model := anObject.
	self root withAllChildrenDo: [:each | each model: anObject ]
]

{ #category : #'concern building' }
REPConcernSpecification >> query: aLabelString by: aStakeholderString meaning: aMeaningString as: aBlock [
	^ self root addChild: 
		((REPCustomQueryConcern on: self model)
			computation: aBlock;
			label: aLabelString;
			stakeholderString: aStakeholderString;
			explanation: aMeaningString;
			yourself )
]

{ #category : #'concern building' }
REPConcernSpecification >> query: aLabelString meaning: aMeaningString as: aBlock [
	^ self root addChild: 
		((REPCustomQueryConcern on: self model)
			computation: aBlock;
			label: aLabelString;
			explanation: aMeaningString;
			yourself )
]

{ #category : #accessing }
REPConcernSpecification >> root [
	^ root
]

{ #category : #accessing }
REPConcernSpecification >> root: anObject [
	root := anObject
]
