Class {
	#name : #AllMooseMetamodelImportingContext,
	#superclass : #MooseAbstractImportingContext,
	#category : #'Moose-GenericImporter'
}

{ #category : #'instance creation' }
AllMooseMetamodelImportingContext class >> new [

	^ super fromMeta: MooseModel meta elements
]
