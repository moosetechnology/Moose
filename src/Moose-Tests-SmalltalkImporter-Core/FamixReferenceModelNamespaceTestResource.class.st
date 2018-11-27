Class {
	#name : #FamixReferenceModelNamespaceTestResource,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #setup }
FamixReferenceModelNamespaceTestResource >> importModel [
	
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		factory: SmalltalkCompatibilityMetamodelFactory;
		model: model;
		doNotRunCandidateOperator;
		addFromPackageNamed: #'Moose-TestResources-Reference-Core';
		addFromPackageNamed: #'Moose-TestResources-Reference-PackageOne';
		addFromPackageNamed: #'Moose-TestResources-Reference-PackageTwo';
		run;
		yourself  
]
