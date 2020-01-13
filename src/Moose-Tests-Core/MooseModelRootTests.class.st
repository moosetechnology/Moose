Class {
	#name : #MooseModelRootTests,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'model',
		'modelClass',
		'savedRoot'
	],
	#category : #'Moose-Tests-Core'
}

{ #category : #'building suites' }
MooseModelRootTests class >> testParameters [
	^ ParametrizedTestMatrix new
		forSelector: #modelClass
		addOptions: MooseModel allSubclasses
]

{ #category : #tests }
MooseModelRootTests >> modelClass [
	^ modelClass
]

{ #category : #tests }
MooseModelRootTests >> modelClass: aMooseModelClass [
	modelClass := aMooseModelClass
]

{ #category : #tests }
MooseModelRootTests >> setUp [
	super setUp.
	savedRoot := MooseModelRoot installedRoot.
	MooseModelRoot resetRoot
]

{ #category : #tests }
MooseModelRootTests >> tearDown [
	super tearDown.
	MooseModelRoot installRoot: savedRoot
]

{ #category : #tests }
MooseModelRootTests >> testCreate [

	model := self modelClass new.
	self deny: (MooseModel root includes: model).
	self modelClass root add: model.
	self assert: (MooseModel root includes: model).
	self assert: (self modelClass root includes: model).
	
]

{ #category : #tests }
MooseModelRootTests >> testDelete [
	model := self modelClass new.
	self modelClass root add: model.
	[ model delete ]
		valueSupplyingAnswer:
			{('Are you sure to want to delete ' , model mooseName printString
				, '?').
			true}.
	self deny: (MooseModel root includes: model).
	self deny: (self modelClass root includes: model)
]

{ #category : #tests }
MooseModelRootTests >> testDeleteNonRegisteredModelRaisesError [
	"Raise an error since it is not in the root"
	self
		should: [ [ self modelClass new delete ] valueSupplyingAnswer: true ]
		raise: Error.
]

{ #category : #tests }
MooseModelRootTests >> testModelRootPointsToMooseModelRootRoot [
	self assert: self modelClass root equals: MooseModelRoot root
]
