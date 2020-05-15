"
Description
--------------------

I am an abstract class defining the basic API my subclasses should respond to. 

My role is to manage for a FamixDependencyDetector, everything specific to the direction of dependencies.
"
Class {
	#name : #FamixDependenciesDetectorDirectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Core-Dependencies'
}

{ #category : #accessing }
FamixDependenciesDetectorDirectionStrategy class >> dependenciesAtReceiverScopeOf: enEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
FamixDependenciesDetectorDirectionStrategy class >> dependenciesOf: aMooseEntity [
	^ self subclassResponsibility
]
