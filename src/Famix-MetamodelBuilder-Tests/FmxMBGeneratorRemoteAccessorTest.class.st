Class {
	#name : #FmxMBGeneratorRemoteAccessorTest,
	#superclass : #TestCase,
	#instVars : [
		'mm',
		'entityA',
		'entityB'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> setUp [
	super setUp.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorA generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorB generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorAB generate.
	mm := MooseModel new.
	"the following entities are created by the generators
	Do not remove them (or change the all the tests)"
	entityA := ((SmalltalkImage current classNamed: 'FmxTestGenerateAccessorAEntityA') ifNil: [ self fail ]) new.
	entityB := ((SmalltalkImage current classNamed: 'FmxTestGenerateAccessorBEntityB') ifNil: [ self fail ]) new.
	mm addAll: { entityA. entityB }
	
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> tearDown [
	[ 'Famix-MetamodelBuilder-TestsResources-A' asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	[ 'Famix-MetamodelBuilder-TestsResources-B' asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	[ 'Famix-MetamodelBuilder-TestsResources-AB' asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	super tearDown
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityA [
	
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityB [
	
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanSetRelationFromEntityA [
	entityA relationToB: entityB.
	self assert: entityA relationToB equals: entityB. 
	self assert: entityB relationToA equals: entityA.
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanSetRelationFromEntityB [
	entityB relationToA: entityA.
	self assert: entityB relationToA equals: entityA. 
	self assert: entityA relationToB equals: entityB.
]
