Class {
	#name : #LANPackageTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #hook }
LANPackageTestResource >> importModel [

	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run;
		yourself
]
