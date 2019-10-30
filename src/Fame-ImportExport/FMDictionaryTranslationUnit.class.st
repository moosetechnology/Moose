Class {
	#name : #FMDictionaryTranslationUnit,
	#superclass : #FMTranslationUnit,
	#instVars : [
		'dictionary'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #accessing }
FMDictionaryTranslationUnit >> dictionary [
	^ dictionary 
]

{ #category : #accessing }
FMDictionaryTranslationUnit >> dictionary: aDictionary [
	dictionary := aDictionary
]

{ #category : #accessing }
FMDictionaryTranslationUnit >> translate: aName ifAbsent: aBlock [ 
	^ dictionary at: aName ifAbsent: aBlock
]
