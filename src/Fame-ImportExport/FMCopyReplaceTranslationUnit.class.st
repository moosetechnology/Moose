Class {
	#name : #FMCopyReplaceTranslationUnit,
	#superclass : #FMTranslationUnit,
	#instVars : [
		'rules'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #initialization }
FMCopyReplaceTranslationUnit >> initialize [
	super initialize.
	rules := OrderedCollection new
]

{ #category : #translate }
FMCopyReplaceTranslationUnit >> replacing: aString with: anOtherString [
	rules add: aString -> anOtherString
]

{ #category : #translate }
FMCopyReplaceTranslationUnit >> translate: aName ifAbsent: aBlock [
	^ rules
		inject: aName
		into:
			[ :t : replaceWithAssociation | t copyReplaceAll: replaceWithAssociation key with: replaceWithAssociation value ]
]
