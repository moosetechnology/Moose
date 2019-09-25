"
Description
--------------------

I am a test resource used when someone needs the composed MM GenerateRemoteAccessor. 

I'll generate the MM and remove it once all tests of the class are finished.
	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	entityA:		First entity of the model
	entityB:		Second entity of the model

"
Class {
	#name : #FamixGenerateRemoteAccessorTestResource,
	#superclass : #TestResource,
	#instVars : [
		'entityA',
		'entityB'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FamixGenerateRemoteAccessorTestResource >> classNamed: aSymbol [
	^ self class environment at: aSymbol ifAbsent: [ self fail ]
]

{ #category : #accessing }
FamixGenerateRemoteAccessorTestResource >> entityA [
	^ entityA
]

{ #category : #accessing }
FamixGenerateRemoteAccessorTestResource >> entityB [
	^ entityB
]

{ #category : #running }
FamixGenerateRemoteAccessorTestResource >> setUp [
	super setUp.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorA generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorB generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorAB generate.
	"the following entities are created by the generators
	Do not remove them (or change the all the tests)"
	entityA := (self classNamed: #FmxTestGenerateAccessorAEntityA) new.
	entityB := (self classNamed: #FmxTestGenerateAccessorBEntityB) new.
	(self classNamed: #FmxTestGenerateAccessorABModel) new addAll: {entityA . entityB}
]

{ #category : #running }
FamixGenerateRemoteAccessorTestResource >> tearDown [
	[ 'Famix-MetamodelBuilder-TestsResources-A' asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	[ 'Famix-MetamodelBuilder-TestsResources-B' asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	[ 'Famix-MetamodelBuilder-TestsResources-AB' asPackage removeFromSystem ]
		on: NotFound
		do: [  ]
]
