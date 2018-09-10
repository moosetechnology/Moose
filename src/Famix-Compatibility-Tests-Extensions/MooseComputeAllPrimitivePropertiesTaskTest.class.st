Class {
	#name : #MooseComputeAllPrimitivePropertiesTaskTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'famixClass'
	],
	#category : #'Famix-Compatibility-Tests-Extensions'
}

{ #category : #running }
MooseComputeAllPrimitivePropertiesTaskTest >> setUp [

	| importTask importer |
	super setUp.
	model := MooseModel new.
	model sourceLanguage: ( FAMIXSmalltalkSourceLanguage new ).

	importTask := MooseImportClassesTask new.
	importTask importerClass: SmalltalkImporter.
	importTask importingContext: (MooseImportingContext new 
											importClass ; importAttribute ; importMethod ; 
											mergeClassAndMetaclass ; yourself).
	importTask addClass: LANNode.
	importer := importTask run.

	famixClass := importer classes at: LANNode.
	model add: famixClass.
	model addAll: famixClass methods.
	
	famixClass := model allClasses first.

]

{ #category : #tests }
MooseComputeAllPrimitivePropertiesTaskTest >> testMetricsAreComputed [
	"We run the task, the metrics are computed therefore, this is relfected in the property"
	
	MooseComputeAllPrimitivePropertiesTask runOnModel: model.

	self assert: (famixClass propertyNamed: #numberOfLinesOfCode) notNil.
	self assert: (famixClass methods allSatisfy: [:m | (m propertyNamed: #numberOfLinesOfCode) notNil])
]

{ #category : #tests }
MooseComputeAllPrimitivePropertiesTaskTest >> testMetricsAreNotComputedPerDefault [
	"Metrics are not computed per default. This means that the state of each element remains empty"
	
	self assert: (famixClass privateState propertyAt: #weightedMethodCount ifAbsent: [nil]) isNil.
	self assert: (famixClass methods allSatisfy: [:m | (m privateState propertyAt: #weightedMethodCount ifAbsent: [nil]) isNil])
]
