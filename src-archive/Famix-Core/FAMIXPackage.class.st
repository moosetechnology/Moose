"
FAMIXPackage represents a package in the source language, meaning that it provides a means to group entities without any baring on lexical scoping. 

Java extractors map Java packages to FAMIXNamespaces. They can also mirror the same information in terms of FAMIXPackage instances.
"
Class {
	#name : #FAMIXPackage,
	#superclass : #FAMIXScopingEntity,
	#instVars : [
		'childNamedEntities'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXPackage class >> annotation [
	<MSEClass: #Package super: #FAMIXScopingEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXPackage >> addChildNamedEntity: aNamedEntity [
	childNamedEntities add: aNamedEntity
]

{ #category : #accessing }
FAMIXPackage >> childNamedEntities [
	<MSEProperty: #childNamedEntities type: #FAMIXNamedEntity opposite: #parentPackage> <multivalued> <derived>
	<MSEComment: 'List of entities contained in this package.'>
	
	^childNamedEntities
]

{ #category : #accessing }
FAMIXPackage >> childNamedEntities: aNamedEntity [
	childNamedEntities value: aNamedEntity
]

{ #category : #'initialize-release' }
FAMIXPackage >> initialize [
	super initialize.
	self isPackage: true.
	childNamedEntities := FMNullMultivalueLink on: self opposite: #parentPackage: selector: #childNamedEntities.
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXPackage >> namespaceScope [

	self shouldNotImplement 
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXPackage >> packageScope [

	^ self
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXPackage >> selectWithinYourScope: aMooseQueryResult [
	^ aMooseQueryResult withinPackage: self
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXPackage >> yourScope [
	
	^ #packageScope
]
