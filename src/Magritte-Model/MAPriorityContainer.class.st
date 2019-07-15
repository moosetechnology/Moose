"
I am a container holding a collection of descriptions and I keep them sorted according to their priority.
"
Class {
	#name : #MAPriorityContainer,
	#superclass : #MAContainer,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAPriorityContainer class >> defaultCollection [
	^ SortedCollection new
]

{ #category : #visiting }
MAPriorityContainer >> acceptMagritte: aVisitor [
	aVisitor visitPriorityContainer: self
]

{ #category : #moving }
MAPriorityContainer >> moveDown: aDescription [
	self shouldNotImplement
]

{ #category : #moving }
MAPriorityContainer >> moveUp: aDescription [
	self shouldNotImplement
]

{ #category : #actions }
MAPriorityContainer >> resort [
	self setChildren: self children copy
]

{ #category : #initialization }
MAPriorityContainer >> setChildren: aCollection [
	super setChildren: aCollection asSortedCollection
]
