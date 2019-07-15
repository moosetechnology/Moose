"
I contain tests that should be executed last as they check for various memory leaks.
"
Class {
	#name : #GTFinalReleaseTest,
	#superclass : #TestCase,
	#category : #'GT-Tests-Release'
}

{ #category : #tests }
GTFinalReleaseTest >> expectedFailures [
	^ #(testNoGLMWindowInstances)
]

{ #category : #tests }
GTFinalReleaseTest >> setUp [
	super setUp.
	
	Smalltalk garbageCollect
]

{ #category : #tests }
GTFinalReleaseTest >> tearDown [
	super tearDown.
	
	Smalltalk garbageCollect
]

{ #category : #tests }
GTFinalReleaseTest >> testNoGLMWindowInstances [

	self assert: GLMSystemWindow allInstances size equals: 0.
]

{ #category : #tests }
GTFinalReleaseTest >> testNoInspectorInstances [

	self assert: GTInspector allInstances size equals: 0
]

{ #category : #tests }
GTFinalReleaseTest >> testNoPlaygroundInstances [

	self assert: GTPlayground allInstances size equals: 0
]

{ #category : #tests }
GTFinalReleaseTest >> testNoSpotterInstances [

	self assert: GTSpotter allInstances size equals: 0.
	self assert: GTSpotterMorph allInstances size equals: 0
]
