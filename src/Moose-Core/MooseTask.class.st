"
MooseTask is an abstract class that define the basic protocol for a Task. Basically a task should define how to run by specifying it in its run method.
It can also specify setUp and tearDown actions
"
Class {
	#name : #MooseTask,
	#superclass : #Object,
	#instVars : [
		'progBar',
		'nb'
	],
	#category : #'Moose-Core'
}

{ #category : #private }
MooseTask >> basicRun [ 
	 
	^self subclassResponsibility
]

{ #category : #accessing }
MooseTask >> description [ 
	 
	^self subclassResponsibility
]

{ #category : #private }
MooseTask >> increment [ 
	 
	progBar ifNotNil: [	nb := nb + 1. progBar value: nb]
]

{ #category : #accessing }
MooseTask >> length [ 
	 
	^self subclassResponsibility
]

{ #category : #running }
MooseTask >> profile [ 
	 
	^ TimeProfiler spyOn: [self run]
]

{ #category : #running }
MooseTask >> run [ 
	 
	| result | 
	[self setUp. 
	result := self basicRun] ensure: [self tearDown]. 
	^result
]

{ #category : #running }
MooseTask >> runSelector: aSelector [
	"Hack to let tasks decide whether to run or runWithProgress (see CompositeTask)"
	
	^ self perform: aSelector
]

{ #category : #running }
MooseTask >> runWithProfiler [ 
	Smalltalk isInteractive 
		ifTrue: [self profile]
		ifFalse: [self run]
]

{ #category : #running }
MooseTask >> runWithProgress [ 
	 
	| result | 
	[self setUp. 
	nb := 0.
	UIManager default
		displayProgress: self description
		from: 1 
		to: self length 
		during: [ :bar | progBar := bar. result := self basicRun]]
			 ensure: [self tearDown]. 
	^result
]

{ #category : #private }
MooseTask >> setUp [ 
	 
	
]

{ #category : #private }
MooseTask >> tearDown [ 
	 
	
]
