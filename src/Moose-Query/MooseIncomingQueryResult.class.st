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

{ #category : #scoping }
MooseIncomingQueryResult >> primCollectAtScope: aScopeSymbol [
	"
	^ self opposites collectAtScope: aScopeSymbol
	"

	self deprecated: 'This method is part of the old query system. Now instead of #collectAtScope: aSymbol you should use #atScope: aClass.' on: '19/05/2016' in: 'Moose6.1'.
	^ self storage collect: [ :dep | (self opposite: dep) perform: aScopeSymbol ]
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
