Class {
	#name : #FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource,
	#superclass : #MooseModelTestResourceWithSmalltalkDependency,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #importing }
FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource >> importModel [
	
	| importer | 
	importer := self newPharoImporterTask.
	importer importingContext mergeClassAndMetaclass.
	importer importerClass: SmalltalkImporter.
	importer doNotRunCandidateOperator.
	importer 
			model: model; 
			addFromPackageNamed: #'Moose-TestResources-Reference-Core'; run.
]
