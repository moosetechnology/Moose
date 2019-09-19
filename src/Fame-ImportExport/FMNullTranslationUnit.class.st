Class {
	#name : #FMNullTranslationUnit,
	#superclass : #FMTranslationUnit,
	#category : #'Fame-ImportExport'
}

{ #category : #translate }
FMNullTranslationUnit >> translate: aName ifAbsent: aBlock [ 
	^ aBlock value 
]
