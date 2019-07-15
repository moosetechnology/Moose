Class {
	#name : #MalHgTestModelSimple,
	#superclass : #Object,
	#instVars : [
		'model',
		'parent',
		'children',
		'level'
	],
	#category : #'Moose-Tests-Algos-HierarchicalGraph'
}

{ #category : #accessing }
MalHgTestModelSimple >> children [
	^ children
]

{ #category : #accessing }
MalHgTestModelSimple >> children: anObject [
	children := anObject
]

{ #category : #'initialize-release' }
MalHgTestModelSimple >> initialize [
	children := OrderedCollection new.
]

{ #category : #testing }
MalHgTestModelSimple >> isLeaf [
	^ children isEmpty.
]

{ #category : #accessing }
MalHgTestModelSimple >> level [
	^ level
]

{ #category : #accessing }
MalHgTestModelSimple >> level: aNumber [
	level := aNumber.
]

{ #category : #accessing }
MalHgTestModelSimple >> model [
	^ model
]

{ #category : #accessing }
MalHgTestModelSimple >> model: anObject [
	model := anObject
]

{ #category : #testing }
MalHgTestModelSimple >> notLeaf [
	^ children notEmpty.
]

{ #category : #accessing }
MalHgTestModelSimple >> parent [
	^ parent
]

{ #category : #accessing }
MalHgTestModelSimple >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
MalHgTestModelSimple >> printOn: aStream [
	aStream
		nextPutAll: 'Test: ';
		nextPutAll: model asString.
]

{ #category : #'as yet unclassified' }
MalHgTestModelSimple >> recursiveChildren [
	"Returns the whole family tree below myself (excluding myself). "
	^ self recursiveChildren: false.
	
]

{ #category : #'as yet unclassified' }
MalHgTestModelSimple >> recursiveChildren: withMyself [
	"Returns the whole family tree below myself. 
	If withMyself is true, also add myself to the returning set."
	| result |
	result := Set new.
	
	withMyself ifTrue: [
		result add: self.
	].
	
	self isLeaf ifTrue: [
		^ result.	
	].

	result addAll: children.
	
	children do: [ :each | 
		result addAll: (each recursiveChildren: true). 
	].

	^ result.
]
