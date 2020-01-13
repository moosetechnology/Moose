"
Description
--------------------

I am a translation unit using a rewrite rule to translate the names of the entities to import.

Examples
--------------------

	FMCopyReplaceTranslationUnit new
		replacing: 'mix' with: 'Famix';
		replacing: 'Famix' with: 'ximaFh';
		replacing: 'h' with: '@';
		translate: 'hello'. ""@ello""
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rules:		<aCollection>		A collection of the rewrite rules to apply to the incomming names.

"
Class {
	#name : #FMCopyReplaceTranslationUnit,
	#superclass : #FMTranslationUnit,
	#instVars : [
		'rules'
	],
	#category : #'Fame-ImportExport-Importers'
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
