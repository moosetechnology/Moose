Class {
	#name : #MooseModelTestResourceWithSmalltalkDependency,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-Tests-Core'
}

{ #category : #'as yet unclassified' }
MooseModelTestResourceWithSmalltalkDependency >> metamodelFactory [

	^ SmalltalkCompatibilityMetamodelFactory
]

{ #category : #'as yet unclassified' }
MooseModelTestResourceWithSmalltalkDependency >> newImportClassesTask [
	
	| importer |

	importer := MooseImportClassesTask new.
	importer factory: self metamodelFactory.

	^ importer
]

{ #category : #'as yet unclassified' }
MooseModelTestResourceWithSmalltalkDependency >> newPharoImporterTask [
	
	| importer |

	importer := MoosePharoImporterTask new.
	importer factory: self metamodelFactory.

	^ importer
]
