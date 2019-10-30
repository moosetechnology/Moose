"
Test relation types between remote and nonremote entities is composed metamodels
"
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

	model := FamixTestComposedModel new.
	
	remoteMethod := FamixTestComposed1Method new.
	entity := FamixTestComposedEntity new.
	remoteClass := FamixTestComposed2Class new.
	
	c1 := FamixTestComposedCustomEntity1 new.
	c2 := FamixTestComposedCustomEntity2 new.
	c3 := FamixTestComposedCustomEntity3 new.
	c4 := FamixTestComposedCustomEntity4 new.

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

{ #category : #tests }
FamixTestComposedMetamodels >> testGenerationOfComposedMetamodel [
	| aGenerator env |
	aGenerator := FamixTestComposedGenerator new beForTesting generate.
	env := aGenerator builder environment ringEnvironment.

	self
		assert:
			(((env ask behaviorNamed: #FamixTestComposedCustomEntity1) methodNamed: #customEntity1) sourceCode
				includesSubstring: '<FMProperty: #customEntity1 type: #FamixTestComposed1CustomEntity1 opposite: #customEntity1>')
]

{ #category : #tests }
FamixTestComposedMetamodels >> testImplicitManyToManyRemote [

	c4 customEntities4: {c14}.
	self assertCollection: c4 customEntities4 hasSameElements: {c14}.
	self assertCollection: c14 customEntities4 hasSameElements: {c4}.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testImplicitManyToOneRemote [

	c3 customEntity3: c13.
	
	self assert: c3 customEntity3 equals: c13.
	self assertCollection: c13 customEntities3 hasSameElements: {c3}.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testImplicitOneToManyRemote [

	c2 customEntities2: {c12}.
	
	self assertCollection: c2 customEntities2 hasSameElements: {c12}.
	self assert: c12 customEntity2 equals: c2.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testImplicitOneToOneRemote [

	c1 customEntity1: c11.
	
	self assert: c1 customEntity1 equals: c11.
	self assert: c11 customEntity1 equals: c1.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testManyToManyRemote [

	c4 c24s: {c24}.
	
	self assertCollection: c4 c24s hasSameElements: {c24}.
	self assertCollection: c24 c4s hasSameElements: {c4}.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testManyToOneRemote [

	c3 c23: c23.
	
	self assert: c3 c23 equals: c23.
	self assertCollection: c23 c3s hasSameElements: {c3}.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testOneToManyRemote [

	c2 c22s: {c22}.
	
	self assertCollection: c2 c22s hasSameElements: {c22}.
	self assert: c22 c2 equals: c2.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testOneToOneRemote [

	c1 c21: c21.
	
	self assert: c1 c21 equals: c21.
	self assert: c21 c1 equals: c1.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testRemoteManyToManyRemote [

	c14 c24s: {c24}.
	
	self assertCollection: c14 c24s hasSameElements: {c24}.
	self assertCollection: c24 c14s hasSameElements: {c14}.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testRemoteManyToOneRemote [

	c13 c23: c23.
	
	self assert: c13 c23 equals: c23.
	self assertCollection: c23 c13s hasSameElements: {c13}.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testRemoteOneToManyRemote [

	c12 c22s: {c22}.
	
	self assertCollection: c12 c22s hasSameElements: {c22}.
	self assert: c22 c12 equals: c12.
]

{ #category : #tests }
FamixTestComposedMetamodels >> testRemoteOneToOneRemote [

	c11 c21: c21.
	
	self assert: c11 c21 equals: c21.
	self assert: c21 c11 equals: c11.
]
