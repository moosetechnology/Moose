"
Description
--------------------

I am a strategy managing for a FamixDependenciesDetector everything related to direction of dependencies when we look for clients of an entity (incoming dependencies).
"
Class {
	#name : #FamixDependenciesDetectorClientsStrategy,
	#superclass : #FamixDependenciesDetectorDirectionStrategy,
	#category : #'Moose-Core-Dependencies'
}

{ #category : #accessing }
FamixDependenciesDetectorClientsStrategy class >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allClients
]

{ #category : #accessing }
FamixDependenciesDetectorClientsStrategy class >> dependenciesOf: aMooseEntity [
	^ aMooseEntity queryIncomingDependencies
]
