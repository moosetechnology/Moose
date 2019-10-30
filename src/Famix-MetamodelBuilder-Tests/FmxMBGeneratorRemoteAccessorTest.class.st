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

{ #category : #accessing }
FmxMBGeneratorRemoteAccessorTest class >> resources [
	^ { FamixGenerateRemoteAccessorTestResource }
]

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> setUp [
	super setUp.
	entityA := FamixGenerateRemoteAccessorTestResource current entityA.
	entityB := FamixGenerateRemoteAccessorTestResource current entityB
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveOneRelationFromEntityB [
	entityB oneA: entityA.
	entityB oneA: nil.
	self assert: entityA manyB isEmpty.
	self assert: entityB oneA equals: nil.
]

{ #category : #tests }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityA [
	entityA relationToB: entityB.
	entityA relationToB: nil.
	self assert: entityA relationToB equals: nil. 
	self assert: entityB relationToA equals: nil.
]

{ #category : #tests }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityB [
	entityB relationToA: entityA.
	entityB relationToA: nil.
	self assert: entityB relationToA equals: nil. 
	self assert: entityA relationToB equals: nil.
]

{ #category : #tests }
FmxMBGeneratorRemoteAccessorTest >> testCanSetRelationFromEntityA [
	entityA relationToB: entityB.
	self assert: entityA relationToB equals: entityB. 
	self assert: entityB relationToA equals: entityA.
]

{ #category : #tests }
FmxMBGeneratorRemoteAccessorTest >> testCanSetRelationFromEntityB [
	entityB relationToA: entityA.
	self assert: entityB relationToA equals: entityA. 
	self assert: entityA relationToB equals: entityB.
]
