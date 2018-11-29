Class {
	#name : #MooseSqueakClassPackageImporterTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #'testing collecting classes' }
MooseSqueakClassPackageImporterTest >> numberOfClassesIn: categories [

	"SIMD 23/11/2009: We reject trait as entities to importer for now."
	^ (SystemOrganization categories select: [ :each | categories anySatisfy: [:c | c match: each]]) 
		inject: 0
		into: [ :sum :each | sum + ((SystemOrganization classesInCategory: each)
																		reject: [:cls | cls isTrait]) size ]
]

{ #category : #'testing collecting classes' }
MooseSqueakClassPackageImporterTest >> testFromPackageMatching [
	"self debug: #testFromCategoryMatching"
	| collector |
	collector := MoosePharoImporterTask new addFromPackagesMatching: [ :each | each name = #'Moose-TestResources-LAN' ].
	self assert: (collector allClasses includes: LANNode)
]

{ #category : #'testing collecting classes' }
MooseSqueakClassPackageImporterTest >> testFromPackageNamed [
	| collector |
	collector := MoosePharoImporterTask new addFromPackageNamed: #'Moose-TestResources-LAN'.
	self assert: (collector allClasses includes: LANNode)
]

{ #category : #'testing collecting classes' }
MooseSqueakClassPackageImporterTest >> testFromPackagesMatching2 [
	"self debug: #testFromCategoryMatching2"

	| collector |
	collector := MoosePharoImporterTask new
		addFromPackagesMatching: [ :each | 'Collections*' match: each name asString ];
		addFromPackagesMatching: [ :each | 'Kernel*' match: each name asString ].
	self assert: collector allClasses size equals: (self numberOfClassesIn: #('Collections*' 'Kernel*'))
]

{ #category : #'test importing' }
MooseSqueakClassPackageImporterTest >> testImportClassUsingAddCategory [
	"self debug: #testImportClassUsingAddCategory"

	| model importer |
	model := MooseModel new.
	importer := MoosePharoImporterTask new
		model: model;
		factory: SmalltalkCompatibilityMetamodelFactory;
		importingContext: MooseImportingContext new importClass.
	importer addFromPackage: (RPackageOrganizer default packageNamed: #'Moose-TestResources-LAN').
	importer run.
	self assert: model allClasses size equals: (self numberOfClassesIn: #('Moose-TestResources-LAN')) * 2
]

{ #category : #'test importing' }
MooseSqueakClassPackageImporterTest >> testImportClassUsingAddClass [
	"self debug: #testImportClassUsingAddClass"

	| model importer |
	model := MooseModel new.
	importer := MoosePharoImporterTask new
		model: model;
		factory: SmalltalkCompatibilityMetamodelFactory;
		importingContext: MooseImportingContext new importClass.
	importer addClass: LANNode.
	importer run.
	self assert: model allClasses size equals: (LANNode subclasses size + 1) * 2
]

{ #category : #'test importing' }
MooseSqueakClassPackageImporterTest >> testImportClassUsingAddPackage [
	"self debug: #testImportClassUsingAddPackage"

	| model importer |
	model := MooseModel new.
	importer := MoosePharoImporterTask new
		model: model;
		factory: SmalltalkCompatibilityMetamodelFactory;
		importingContext: MooseImportingContext new importClass.
	importer addFromPackage: (RPackage organizer packageNamed: #'Moose-TestResources-LAN').
	importer run.
	self
		assert: model allClasses size
		equals: 2 * (RPackage organizer packageNamed: #'Moose-TestResources-LAN') regularClasses size
]

{ #category : #'test importing' }
MooseSqueakClassPackageImporterTest >> testImportClassUsingAddPackageNamed [
	"self debug: #testImportClassUsingAddPackageNamed"

	| model importer |
	model := MooseModel new.
	importer := MoosePharoImporterTask new.
	importer
		model: model;
		factory: SmalltalkCompatibilityMetamodelFactory;
		importingContext: MooseImportingContext new importClass.
	importer addFromPackageNamed: 'Moose-TestResources-LAN'.
	importer run.
	self
		assert: model allClasses size
		equals: 2 * (RPackage organizer packageNamed: #'Moose-TestResources-LAN') regularClasses size
]
