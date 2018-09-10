Class {
	#name : #FAMIXCustomGraphTraverser,
	#superclass : #FAMIXGraphTraverser,
	#instVars : [
		'traversal'
	],
	#category : #'Famix-Extensions'
}

{ #category : #'as yet unclassified' }
FAMIXCustomGraphTraverser class >> for: aTraversalBlock [
	^ self new traversal: aTraversalBlock; yourself
]

{ #category : #accessing }
FAMIXCustomGraphTraverser >> traversal [
	^ traversal
]

{ #category : #accessing }
FAMIXCustomGraphTraverser >> traversal: anObject [
	traversal := anObject
]

{ #category : #running }
FAMIXCustomGraphTraverser >> traverse: anEntity [
	^ self traversal value: anEntity
]
