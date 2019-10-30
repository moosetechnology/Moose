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
	#category : #'Moose-Query-Results'
}

{ #category : #private }
MooseIncomingQueryResult >> opposite: aDependency [

	^ aDependency from
]
