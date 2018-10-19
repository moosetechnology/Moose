Class {
	#name : #FamixTestComposedMetamodels,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'remoteMethod',
		'entity',
		'remoteClass',
		'c1',
		'c2',
		'c3',
		'c4',
		'c11',
		'c12',
		'c13',
		'c14',
		'c21',
		'c22',
		'c23',
		'c24'
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
	
	c1 := FamixTestComposedCustomEntity1 new.
	c2 := FamixTestComposedCustomEntity2 new.
	c3 := FamixTestComposedCustomEntity3 new.
	c4 := FamixTestComposed1CustomEntity4 new.

	c11 := FamixTestComposed1CustomEntity1 new.
	c12 := FamixTestComposed1CustomEntity2 new.
	c13 := FamixTestComposed1CustomEntity3 new.
	c14 := FamixTestComposed1CustomEntity4 new.
	
	c21 := FamixTestComposed2CustomEntity1 new.
	c22 := FamixTestComposed2CustomEntity2 new.
	c23 := FamixTestComposed2CustomEntity3 new.
	c24 := FamixTestComposed2CustomEntity4 new.

	model addAll: { remoteMethod. entity. remoteClass. c1. c2. c3. c4. c11. c12. c13. c14. c21. c22. c23. c24 }.
	
	
]

{ #category : #running }
FamixTestComposedMetamodels >> testImplicitManyToManyRemote [

	c4 customEntity4s: {c14}.
	
	self assertCollection: c4 customEntity4s hasSameElements: {c14}.
	self assertCollection: c14 customEntity4s hasSameElements: {c4}.
]

{ #category : #running }
FamixTestComposedMetamodels >> testImplicitManyToOneRemote [

	c3 customEntity3: c13.
	
	self assert: c3 customEntity3 equals: c13.
	self assertCollection: c13 customEntity3s hasSameElements: {c3}.
]

{ #category : #running }
FamixTestComposedMetamodels >> testImplicitOneToManyRemote [

	c2 customEntity2s: {c12}.
	
	self assertCollection: c2 customEntity2s hasSameElements: {c12}.
	self assert: c12 customEntity2 equals: c2.
]

{ #category : #running }
FamixTestComposedMetamodels >> testImplicitOneToOneRemote [

	c1 customEntity1: c11.
	
	self assert: c1 customEntity1 equals: c11.
	self assert: c11 customEntity1 equals: c1.
]
