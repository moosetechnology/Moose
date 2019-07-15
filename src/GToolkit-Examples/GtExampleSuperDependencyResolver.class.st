"
I detect if a super send is a dependency to an example.
"
Class {
	#name : #GtExampleSuperDependencyResolver,
	#superclass : #GtExampleDependencyResolver,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleSuperDependencyResolver >> appliesTo: anASTNode [
	^ anASTNode isMessage and: [ anASTNode isSuperSend ]
]

{ #category : #action }
GtExampleSuperDependencyResolver >> posibleExampleForNode: aMessageNode fromMethod: aCompiledMethod [
	| possibleExampleMethod |
	possibleExampleMethod := aCompiledMethod methodClass superclass lookupSelector: aMessageNode selector.
	^ self exampleFromMethod: possibleExampleMethod
]
