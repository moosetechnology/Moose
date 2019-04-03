"
MooseCustomTask is a task perform some computation specified as a block.

The main API is then

	with: aBlock description: aDescription length: aNumber

"
Class {
	#name : #MooseCustomTask,
	#superclass : #MooseTask,
	#instVars : [
		'computation',
		'description',
		'length'
	],
	#category : #'Moose-Core'
}

{ #category : #'instance creation' }
MooseCustomTask class >> runWithProgress: aBlock description: aDescription length: aNumber [
	^ self new 
		with: aBlock description: aDescription length: aNumber; 
		runWithProgress;
		yourself
]

{ #category : #private }
MooseCustomTask >> basicRun [
	computation value: self
]

{ #category : #accessing }
MooseCustomTask >> description [
	^ description
]

{ #category : #accessing }
MooseCustomTask >> length [
	^ length
]

{ #category : #'initialize-release' }
MooseCustomTask >> with: aBlock description: aDescription length: aNumber [
	computation := aBlock.
	description := aDescription.
	length := aNumber
]
