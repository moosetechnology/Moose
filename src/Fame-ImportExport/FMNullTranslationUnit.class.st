Class {
	#name : #FMNullTranslationUnit,
	#superclass : #FMTranslationUnit,
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #translate }
FMNullTranslationUnit >> translate: aName ifAbsent: aBlock [ 
	^ aBlock value 
]
