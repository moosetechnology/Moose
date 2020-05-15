"
Description
--------------------

I am a strategy managing for a FamixDependenciesDetector everything related to direction of dependencies when we look for providiers of an entity (outgoing dependencies).
"
Class {
	#name : #FamixDependenciesDetectorProvidersStrategy,
	#superclass : #FamixDependenciesDetectorDirectionStrategy,
	#category : #'Moose-Core-Dependencies'
}

{ #category : #accessing }
FamixDependenciesDetectorProvidersStrategy class >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allProviders
]

{ #category : #accessing }
FamixDependenciesDetectorProvidersStrategy class >> dependenciesOf: aMooseEntity [
	^ aMooseEntity queryOutgoingDependencies
]
