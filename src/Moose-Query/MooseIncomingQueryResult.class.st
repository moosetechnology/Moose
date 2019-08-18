"
Description
--------------------

Result of a navigation query for the incoming associations of an entity.
"
Class {
	#name : #MooseIncomingQueryResult,
	#superclass : #MooseQueryResult,
	#traits : 'TDependencyQueryResult',
	#classTraits : 'TDependencyQueryResult classTrait',
	#category : #'Moose-Query'
}

{ #category : #private }
MooseIncomingQueryResult >> isOppositeMultivalued: aDependency [
	^ (aDependency class mooseDescription attributes detect: [ :att | att isSource ])  isMultivalued
]

{ #category : #private }
MooseIncomingQueryResult >> opposite: aDependency [

	^ aDependency from
]

{ #category : #accessing }
MooseIncomingQueryResult >> targets [
	^ (self collectAsSet: #to) flattened
]

{ #category : #accessing }
MooseIncomingQueryResult >> targetsAtScope: aTraitOrClass [
	^ self targets flatCollectAsSet: [ :e | e atScope: aTraitOrClass ]
]
