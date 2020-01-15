"
Description
--------------------

My subclasses provides ways to translate the names of entities been imported by a FMImporter.

It might happen that we want to translate the names of entities previously exported while we import them back.
For example, if the model changed the name of the classes but a parser was not updated, we can use translation units to match the names.
"
Class {
	#name : #FMTranslationUnit,
	#superclass : #Object,
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #translate }
FMTranslationUnit >> translate: aName [
	^ self translate: aName ifAbsent: [ aName ]
]

{ #category : #translate }
FMTranslationUnit >> translate: aName ifAbsent: aBlock [ 
	self subclassResponsibility .
]
