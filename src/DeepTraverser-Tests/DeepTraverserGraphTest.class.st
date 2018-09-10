Class {
	#name : #DeepTraverserGraphTest,
	#superclass : #TestCase,
	#instVars : [
		'graph'
	],
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #testing }
DeepTraverserGraphTest class >> isAbstract [
	^ self == DeepTraverserGraphTest
]

{ #category : #private }
DeepTraverserGraphTest >> nextGraphElementsFrom: each [
	^ graph at: each ifAbsent: [ #() ]
]

{ #category : #running }
DeepTraverserGraphTest >> setUp [
	super setUp.
	
	graph := Dictionary new.
	graph at: 0 put: { 1 }.
	graph at: 1 put: { 2 . 3 }.
	graph at: 2 put: { 3 }.
	graph at: 4 put: { 3 }.
	graph at: 10 put: { 11 }
]

{ #category : #tests }
DeepTraverserGraphTest >> testImplementations [
	| results |
	results := DeepTraverserWithoutAction withAllSubclasses collect: [ :class |
		(class new 
			onNodeTraverse: [ :each | self nextGraphElementsFrom: each ];
			on: graph startWith: 0;
			yourself) upToEnd ].
		
	self assert: results notEmpty.
	self assert: (results allSatisfy: [ :each | each notEmpty ]).
	self assert: results asSet size = 1
]
