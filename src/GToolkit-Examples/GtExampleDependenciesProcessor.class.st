"
I provide the basic logic for traversing over the dependencies of an example.  By default I traverse first the dependencies of an example before traversing the actual node. 

#processExampleFirst - Change the traversal logic so that an example is visited before its dependencies
#onProcess: - Provides a block that determines how the examples and its dependencies are visited
"
Class {
	#name : #GtExampleDependenciesProcessor,
	#superclass : #GtExampleProcessor,
	#instVars : [
		'processing',
		'onProcess'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #private }
GtExampleDependenciesProcessor >> handleRecursionErrorFor: anExample [
	^ (GtExampleRecursionDetected new 
		example: self example;
		resolved: processing;
		next: anExample;
		yourself) signal
]

{ #category : #initialization }
GtExampleDependenciesProcessor >> initialize [
	super initialize.
	
	self processDependenciesFirst.
	processing := IdentitySet new.
]

{ #category : #accessing }
GtExampleDependenciesProcessor >> onProcess [
	^ onProcess
]

{ #category : #accessing }
GtExampleDependenciesProcessor >> onProcess: anObject [
	onProcess := anObject
]

{ #category : #private }
GtExampleDependenciesProcessor >> process: anExample [
	^ self process: anExample withoutLoopsDo: [ 
		self onProcess value: self value: anExample ]
]

{ #category : #private }
GtExampleDependenciesProcessor >> process: anExample withoutLoopsDo: aBlock [
	"I check whether we already scheduled the given example for processing to prevent recursion."
	| value |
	value := nil.
	processing do: [ :processingExample |
		(processingExample = anExample) ifTrue: [
			^ self handleRecursionErrorFor: anExample ] ].	
	processing add: anExample. " prepare processing this example "
	context example: anExample.
	value := aBlock value. " process this example "
	processing remove: anExample. " done processing "
	^ value
]

{ #category : #converting }
GtExampleDependenciesProcessor >> processDependenciesFirst [
	self onProcess: [ :aProcessor :anExample | 
		aProcessor processDependenciesFor: anExample.
		aProcessor basicProcess: anExample ]
]

{ #category : #private }
GtExampleDependenciesProcessor >> processDependenciesFor: anExample [
	anExample directDependencies do: [ :each | self process: each ]
]

{ #category : #converting }
GtExampleDependenciesProcessor >> processExampleFirst [
	self onProcess: [ :aProcessor :anExample | 
		aProcessor basicProcess: anExample.
		aProcessor processDependenciesFor: anExample ]
]
