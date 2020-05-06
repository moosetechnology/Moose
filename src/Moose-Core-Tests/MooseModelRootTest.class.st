Class {
	#name : #MooseModelRootTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'model',
		'modelClass',
		'savedRoot'
	],
	#category : #'Moose-Core-Tests'
}

{ #category : #'building suites' }
MooseModelRootTest class >> testParameters [
	^ ParametrizedTestMatrix new
		forSelector: #modelClass
		addOptions: MooseModel allSubclasses
]

{ #category : #tests }
MooseModelRootTest >> modelClass [
	^ modelClass
]

{ #category : #tests }
MooseModelRootTest >> modelClass: aMooseModelClass [
	modelClass := aMooseModelClass
]

{ #category : #running }
MooseModelRootTest >> setUp [
	super setUp.
	savedRoot := MooseModelRoot installedRoot.
	MooseModelRoot resetRoot
]

{ #category : #running }
MooseModelRootTest >> tearDown [
	MooseModelRoot installRoot: savedRoot.
	super tearDown
]

{ #category : #tests }
MooseModelRootTest >> testCreate [

	model := self modelClass new.
	self deny: (MooseModel root includes: model).
	self modelClass root add: model.
	self assert: (MooseModel root includes: model).
	self assert: (self modelClass root includes: model).
	
]

{ #category : #tests }
MooseModelRootTest >> testModelRootPointsToMooseModelRootRoot [
	self assert: self modelClass root equals: MooseModelRoot root
]

{ #category : #tests }
MooseModelRootTest >> testRemove [
	model := self modelClass new.
	self modelClass root add: model.
	model remove.
	self deny: (MooseModel root includes: model).
	self deny: (self modelClass root includes: model)
]
