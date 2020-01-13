"
Description
--------------------

I am a translation unit using a dictionary to map incoming names with their translation.

Examples
--------------------

	FMDictionaryTranslationUnit new
		dictionary: { 'hello' -> 'olleh' . 'famix' -> 'ximaf' } asDictionary;
		translate: 'hello'. ""olleh""
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	dictionary:		<aDictionary> 		A dictionary containing all the names to translate with their translations.
"
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
