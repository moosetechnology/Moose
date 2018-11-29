Class {
	#name : #LANPackageTestResource,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #hook }
LANPackageTestResource >> importModel [

	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		factory: SmalltalkCompatibilityMetamodelFactory;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run;
		yourself
]
