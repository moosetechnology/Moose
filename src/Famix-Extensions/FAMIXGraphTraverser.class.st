Class {
	#name : #FAMIXGraphTraverser,
	#superclass : #FAMIXVisitor,
	#instVars : [
		'graph',
		'visited'
	],
	#category : #'Famix-Extensions'
}

{ #category : #'public interface' }
FAMIXGraphTraverser >> go: anObject [
	anObject accept: self.
	^ self visited
]

{ #category : #accessing }
FAMIXGraphTraverser >> graph [
	^ graph
]

{ #category : #accessing }
FAMIXGraphTraverser >> graph: anObject [
	graph := anObject
]

{ #category : #visiting }
FAMIXGraphTraverser >> hasAlreadyVisited: anEntity [
	^ self visited includes: anEntity
]

{ #category : #initialization }
FAMIXGraphTraverser >> initialize [ 
	visited := IdentitySet new.
	graph := MalGraphStructure new 
		nodeClass: MalNodeWithPreviousAndNext;
		yourself.
]

{ #category : #visiting }
FAMIXGraphTraverser >> traverse: anEntity [
	^ self subclassResponsibility
]

{ #category : #visiting }
FAMIXGraphTraverser >> visitEntity: anEntity [
	| targetEntities |
	(self hasAlreadyVisited: anEntity)
		ifTrue: [ ^ self ].
	graph nodes: {anEntity}.
	visited add: anEntity.
	targetEntities := self traverse: anEntity.
	targetEntities do: [ :each | each ifNotNil: [ each accept: self ] ].
	graph edges: targetEntities from: [ :x | anEntity ] to: [ :x | x ]
]

{ #category : #accessing }
FAMIXGraphTraverser >> visited [
	^ visited
]
