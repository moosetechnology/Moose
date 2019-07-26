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
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveManyRelationFromEntityA [
	entityA manyB add: entityB.
	entityA manyB removeAll.
	self assert: entityA manyB isEmpty.
	self assert: entityB oneA equals: nil.
	entityA manyB add: entityB.
	entityA manyB remove: entityB.
	self assert: entityA manyB isEmpty.
	self assert: entityB oneA equals: nil.
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveMultiMultiRelationFromEntityA [
	entityA manyManyB add: entityB.
	entityA manyManyB removeAll.
	self assert: entityA manyManyB isEmpty.
	self assert: entityB manyManyA isEmpty.
	entityA manyManyB add: entityB.
	entityA manyManyB remove: entityB.
	self assert: entityA manyManyB isEmpty.
	self assert: entityB manyManyA isEmpty.
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveMultiMultiRelationFromEntityB [
	entityB manyManyA add: entityA.
	entityB manyManyA removeAll.
	self assert: entityA manyManyB isEmpty.
	self assert: entityB manyManyA isEmpty.
	entityB manyManyA add: entityA.
	entityB manyManyA remove: entityA.
	self assert: entityA manyManyB isEmpty.
	self assert: entityB manyManyA isEmpty.
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveOneRelationFromEntityB [
	entityB oneA: entityA.
	entityB oneA: nil.
	self assert: entityA manyB isEmpty.
	self assert: entityB oneA equals: nil.
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityA [
	entityA relationToB: entityB.
	entityA relationToB: nil.
	self assert: entityA relationToB equals: nil. 
	self assert: entityB relationToA equals: nil.
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityB [
	entityB relationToA: entityA.
	entityB relationToA: nil.
	self assert: entityB relationToA equals: nil. 
	self assert: entityA relationToB equals: nil.
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
