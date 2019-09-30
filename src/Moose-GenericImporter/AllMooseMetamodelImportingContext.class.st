Class {
	#name : #AllMooseMetamodelImportingContext,
	#superclass : #MooseAbstractImportingContext,
	#category : #'Moose-GenericImporter'
}

{ #category : #'instance creation' }
AllMooseMetamodelImportingContext class >> new [
	self flag: #todo.	"This code was produced before we had multiple MMs. It should probably be refactored."
	^ super fromMeta: FAMIXModel new elements
]
