Class {
	#name : #FMTranslationUnit,
	#superclass : #Object,
	#category : #'Fame-ImportExport'
}

{ #category : #translate }
FMTranslationUnit >> translate: aName [
	^ self translate: aName ifAbsent: [ aName ]
]

{ #category : #translate }
FMTranslationUnit >> translate: aName ifAbsent: aBlock [ 
	self subclassResponsibility .
]
