Class {
	#name : #FamixReferenceModelNamespaceTestResource,
	#superclass : #MooseModelTestResourceWithSmalltalkDependency,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #setup }
FamixReferenceModelNamespaceTestResource >> importModel [
	
	self newPharoImporterTask
		importerClass: SmalltalkImporter;
		model: model;
		doNotRunCandidateOperator;
		addFromPackageNamed: #'Moose-TestResources-Reference-Core';
		addFromPackageNamed: #'Moose-TestResources-Reference-PackageOne';
		addFromPackageNamed: #'Moose-TestResources-Reference-PackageTwo';
		run;
		yourself  
]

{ #category : #setup }
FamixReferenceModelNamespaceTestResource >> metamodelFactory [

	^ SmalltalkMetamodelFactory
]

{ #category : #setup }
FamixReferenceModelNamespaceTestResource >> newPharoImporterTask [
	
	| importer |

	importer := MoosePharoImporterTask new.
	importer factory: self metamodelFactory.

	^ importer
]
