"
I am an example processor that can traverse the dependencies of an example and execute an action on each of them. I only execute the given action on the actual dependencies of the given example and not on the given example itself.
"
Class {
	#name : #GtExampleTraverser,
	#superclass : #GtExampleDependenciesProcessor,
	#instVars : [
		'action'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #accessing }
GtExampleTraverser >> action [
	^ action
]

{ #category : #accessing }
GtExampleTraverser >> action: anObject [
	action := anObject
]

{ #category : #private }
GtExampleTraverser >> basicProcess: anExample [
	self action ifNotNil: [ self example == anExample ifFalse: [ self action value: anExample ] ].
]

{ #category : #initialization }
GtExampleTraverser >> initialize [
	super initialize.
	action := [ :anExample | ]
]
