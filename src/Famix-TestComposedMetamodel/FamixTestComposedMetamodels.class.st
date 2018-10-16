Class {
	#name : #FamixTestComposedMetamodels,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'remoteMethod',
		'entity'
	],
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #running }
FamixTestComposedMetamodels >> setUp [

	super setUp.

	model := MooseModel new.
	model metamodel: FamixTestComposedGenerator metamodel.
	
	remoteMethod := FamixTest1Method new.
	entity := FamixTestComposedEntity new.
	
	model addAll: { remoteMethod. entity }.
	
	
]

{ #category : #running }
FamixTestComposedMetamodels >> testOneRemoteToOne [

	entity method: remoteMethod.
	
	self assert: entity method equals: remoteMethod.
	self assert: remoteMethod entity equals: entity.
]
