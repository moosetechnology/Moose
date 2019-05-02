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

{ #category : #importing }
FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource >> metamodelFactory [

	^ SmalltalkMetamodelFactory
]

{ #category : #importing }
FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource >> newPharoImporterTask [
	
	| importer |

	importer := MoosePharoImporterTask new.
	importer factory: self metamodelFactory.

	^ importer
]
