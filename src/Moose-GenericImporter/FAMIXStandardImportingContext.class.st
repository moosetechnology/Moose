Class {
	#name : #FAMIXStandardImportingContext,
	#superclass : #MooseAbstractImportingContext,
	#category : #'Moose-GenericImporter-Contexts'
}

{ #category : #'instance creation' }
FAMIXStandardImportingContext class >> new [

	| collectionOfFM3Eelements |
	collectionOfFM3Eelements := FAMIXSourcedEntity allSubclasses collect: [:each | each asMooseDescription ].
	^ super fromMeta: collectionOfFM3Eelements .
]
