Class {
	#name : #FmxMBTestCase,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBTestCase >> setUp [

	super setUp.
	builder := FamixMetamodelBuilder forTesting.

]
