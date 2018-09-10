Class {
	#name : #REPConcern,
	#superclass : #Object,
	#instVars : [
		'model',
		'announcer'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #'instance creation' }
REPConcern class >> on: aModel [
	^ self new 
		model: aModel;
		yourself
]

{ #category : #accessing }
REPConcern >> allLeafConcerns [
	| leafs |
	leafs := OrderedCollection new.
	self withAllChildrenDo: [:each | 
		each isComposite ifFalse: [
			leafs add: each ]].
	^ leafs
]

{ #category : #announcements }
REPConcern >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
REPConcern >> children [ 
	^ OrderedCollection new
]

{ #category : #updating }
REPConcern >> doUpdate [
	self subclassResponsibility
]

{ #category : #accessing }
REPConcern >> explanation [
	^ self label
]

{ #category : #testing }
REPConcern >> isComposite [
	^ false
]

{ #category : #accessing }
REPConcern >> label [ 
	^ String space join: self class name piecesCutWhereCamelCase
]

{ #category : #accessing }
REPConcern >> model [
	^ model
]

{ #category : #accessing }
REPConcern >> model: anObject [
	model := anObject
]

{ #category : #accessing }
REPConcern >> result [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
REPConcern >> stakeholder [
	^ REPStakeholder everyone
]

{ #category : #accessing }
REPConcern >> status [
	^ REPConcernStatus new concern: self
]

{ #category : #accessing }
REPConcern >> stringResult [ 
	| r |
	r := self result.
	r isCollection ifTrue: [
		^ (String with: Character cr) join: (r collect: #gtDisplayString) ].
	^ r gtDisplayString
]

{ #category : #updating }
REPConcern >> update [ 
	self doUpdate.
	self announcer announce: REPConcernResultAnnouncement new
]

{ #category : #enumerating }
REPConcern >> withAllChildrenDo: aBlock [
	aBlock value: self.
	self children do: [:each |
		each withAllChildrenDo: aBlock ]
]
