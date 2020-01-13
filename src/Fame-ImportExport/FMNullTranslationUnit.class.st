"
Description
--------------------

I am a translation unit doing nothing. I follow a Null Design Pattern.
"
Class {
	#name : #FMNullTranslationUnit,
	#superclass : #FMTranslationUnit,
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #translate }
FMNullTranslationUnit >> translate: aName ifAbsent: aBlock [ 
	^ aBlock value 
]
