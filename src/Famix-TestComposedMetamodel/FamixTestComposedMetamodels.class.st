Class {
	#name : #FamixTestComposedMetamodels,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'remoteMethod',
		'entity',
		'remoteClass'
	],
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #running }
FamixTestComposedMetamodels >> setUp [

	super setUp.

	model := MooseModel new.
	model metamodel: FamixTestComposedGenerator metamodel.
	
	remoteMethod := FamixTestComposed1Method new.
	entity := FamixTestComposedEntity new.
	remoteClass := FamixTestComposed2Class new.
	
	model addAll: { remoteMethod. entity. remoteClass }.
	
	
]

{ #category : #running }
FamixTestComposedMetamodels >> testOneRemoteToOne [

	entity method: remoteMethod.
	
	self assert: entity method equals: remoteMethod.
	self assert: remoteMethod entity equals: entity.
]
