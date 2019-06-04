Class {
	#name : #FmxMBGeneratorRemoteAccessorTest,
	#superclass : #TestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBGeneratorRemoteAccessorTest >> setUp [
	super setUp.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorA generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorB generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorAB generate
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
FmxMBGeneratorRemoteAccessorTest >> testEmpty [
]
