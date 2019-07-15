Class {
	#name : #MooseTestWithSmalltalkDependency,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #'as yet unclassified' }
MooseTestWithSmalltalkDependency >> metamodelFactory [

	^ SmalltalkCompatibilityMetamodelFactory

]

{ #category : #'as yet unclassified' }
MooseTestWithSmalltalkDependency >> newImportClassesTask [
	
	| importer |

	importer := MooseImportClassesTask new.
	importer factory: self metamodelFactory.

	^ importer
]

{ #category : #'as yet unclassified' }
MooseTestWithSmalltalkDependency >> newPharoImporterTask [
	
	| importer |

	importer := MoosePharoImporterTask new.
	importer factory: self metamodelFactory.

	^ importer
]
