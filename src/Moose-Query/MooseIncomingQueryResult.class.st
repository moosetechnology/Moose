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
MooseIncomingQueryResult >> targetClasses [
	
	"flatten targets as we receive candidates instead of single elements for incoming invocations"
	^ self targets deepFlatten collectAsSet: #typeScope
]

{ #category : #accessing }
MooseIncomingQueryResult >> targetMethods [
	"Only valid if dependencies are invocations"
	
	^ storage flatCollectAsSet: [ :invo | invo candidates ]
]

{ #category : #accessing }
MooseIncomingQueryResult >> targets [

	^ self collectAsSet: #to
]
