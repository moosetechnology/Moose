Class {
	#name : #MalHgTestEdge,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Moose-Tests-Algos-HierarchicalGraph'
}

{ #category : #'instance creation' }
MalHgTestEdge class >> from: from to: to [
	^ self new from: from; to: to; yourself.
]

{ #category : #accessing }
MalHgTestEdge >> from [
	^ from
]

{ #category : #accessing }
MalHgTestEdge >> from: anObject [
	from := anObject
]

{ #category : #accessing }
MalHgTestEdge >> to [
	^ to
]

{ #category : #accessing }
MalHgTestEdge >> to: anObject [
	to := anObject
]
