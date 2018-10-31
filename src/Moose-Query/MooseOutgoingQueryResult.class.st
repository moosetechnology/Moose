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
	#category : #'Moose-Query'
}

{ #category : #private }
MooseOutgoingQueryResult >> isOppositeMultivalued: aDependency [

	^ (aDependency attributesTogetherWithGenerated
		detect: [ :att | att isTarget ]) isMultivalued
]

{ #category : #private }
MooseOutgoingQueryResult >> opposite: aDependency [

	^ aDependency to
]

{ #category : #accessing }
MooseOutgoingQueryResult >> sourceClasses [

	^ self sources collectAsSet: #typeScope
]

{ #category : #accessing }
MooseOutgoingQueryResult >> sources [

	^ self collectAsSet: #from
]
