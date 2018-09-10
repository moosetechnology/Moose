"
I detect if a self send is a dependency to an example.
"
Class {
	#name : #GtExampleSelfDependencyResolver,
	#superclass : #GtExampleDependencyResolver,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleSelfDependencyResolver >> appliesTo: anASTNode [
	^ anASTNode isMessage and: [ anASTNode isSelfSend ]
]

{ #category : #action }
GtExampleSelfDependencyResolver >> posibleExampleForNode: aMessageNode fromMethod: aCompiledMethod [
	| possibleExampleMethod |
	possibleExampleMethod := aCompiledMethod methodClass lookupSelector: aMessageNode selector.
	^ self exampleFromMethod: possibleExampleMethod
]
