Class {
	#name : #MooseTestWithSmalltalkDependency,
	#superclass : #TestCase,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #'as yet unclassified' }
MooseTestWithSmalltalkDependency >> metamodelFactory [
	^ SmalltalkMetamodelFactory
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