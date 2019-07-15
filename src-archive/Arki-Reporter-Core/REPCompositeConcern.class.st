Class {
	#name : #REPCompositeConcern,
	#superclass : #REPConcern,
	#instVars : [
		'children',
		'label',
		'explanation'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPCompositeConcern >> addChild: aConcern [
	^ self children add: aConcern
]

{ #category : #accessing }
REPCompositeConcern >> children [
	^ children
]

{ #category : #accessing }
REPCompositeConcern >> children: anObject [
	children := anObject
]

{ #category : #updating }
REPCompositeConcern >> doUpdate [ 
	^ self children do: [:each | each update]
]

{ #category : #accessing }
REPCompositeConcern >> explanation [
	^ explanation
]

{ #category : #accessing }
REPCompositeConcern >> explanation: anObject [
	explanation := anObject
]

{ #category : #'initialize-release' }
REPCompositeConcern >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : #testing }
REPCompositeConcern >> isComposite [
	^ true
]

{ #category : #accessing }
REPCompositeConcern >> label [
	^ label
]

{ #category : #accessing }
REPCompositeConcern >> label: anObject [
	label := anObject
]

{ #category : #accessing }
REPCompositeConcern >> leafChildrenDo: aBlock [
	self children do: [:each |
		each isComposite 
			ifFalse: [aBlock value: each ]
			ifTrue: [each leafChildrenDo: aBlock ]]
]

{ #category : #accessing }
REPCompositeConcern >> status [
	| status |
	self children isEmpty ifTrue: [^ REPConcernNeutralStatus new concern: self ].
	status := self children first status.
	self children allButFirstDo: [:each | 
		status := status union: each status ].
	^ status concern: self
]
