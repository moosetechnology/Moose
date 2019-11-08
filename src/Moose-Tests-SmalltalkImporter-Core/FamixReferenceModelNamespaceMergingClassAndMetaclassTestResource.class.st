Class {
	#name : #FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #importing }
FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource >> importModel [
	
	| importer | 
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer importerClass: SmalltalkImporter.
	importer doNotRunCandidateOperator.
	importer 
			model: model; 
			addFromPackageNamed: #'Moose-TestResources-Reference-Core'; run.
]
