Class {
	#name : #LANPackageTestResource,
	#superclass : #MooseModelTestResourceWithSmalltalkDependency,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #hook }
LANPackageTestResource >> importModel [

	self newPharoImporterTask
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run;
		yourself
]
