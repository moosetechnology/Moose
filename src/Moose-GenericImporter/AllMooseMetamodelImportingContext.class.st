Class {
	#name : #AllMooseMetamodelImportingContext,
	#superclass : #MooseAbstractImportingContext,
	#category : #'Moose-GenericImporter-Contexts'
}

{ #category : #'instance creation' }
AllMooseMetamodelImportingContext class >> new [

	^ super fromMeta: MooseModel meta elements
]
