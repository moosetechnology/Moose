"
Description
--------------------

Result of a navigation query for the outgoing associations of an entity.
"
Class {
	#name : #MooseOutgoingQueryResult,
	#superclass : #MooseQueryResult,
	#traits : 'TDependencyQueryResult',
	#classTraits : 'TDependencyQueryResult classTrait',
	#category : #'Moose-Query-Results'
}

{ #category : #private }
MooseOutgoingQueryResult >> opposite: aDependency [

	^ aDependency to
]
