"
settings for the FamixMetamodelBuilder
"
Class {
	#name : #FmxMBConfiguration,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'packageName',
		'packageNameForAnnotations',
		'classTag',
		'traitTag',
		'basicSuperclassName',
		'basicTraitName',
		'wantsToGenerateImportingContext'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #accessing }
FmxMBConfiguration >> basicSuperclassName [

	^ basicSuperclassName ifNil: [ basicSuperclassName := self defaultBasicSuperclassName ]
]

{ #category : #accessing }
FmxMBConfiguration >> basicSuperclassName: anObject [
	basicSuperclassName := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> basicTraitName [

	^ basicTraitName ifNil: [ basicTraitName := self defaultBasicTraitName ]
]

{ #category : #accessing }
FmxMBConfiguration >> basicTraitName: anObject [
	basicTraitName := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> classTag [

	^ classTag ifNil: [ classTag := self defaultClassTag ]
]

{ #category : #accessing }
FmxMBConfiguration >> classTag: anObject [
	classTag := anObject
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultBasicSuperclassName [

	^ #MooseEntity
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultBasicTraitName [

	^ #Trait
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultClassTag [

	^ #Entities
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultTraitTag [

	^ #Traits
]

{ #category : #accessing }
FmxMBConfiguration >> initialize [

	super initialize.
	
	wantsToGenerateImportingContext := false.
	
	
	
]

{ #category : #accessing }
FmxMBConfiguration >> packageName [
	^ packageName ifNil: [ packageName := #'FamixMetamodelBulder-Generated' ]
]

{ #category : #accessing }
FmxMBConfiguration >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> packageNameForAnnotations [
	^ packageNameForAnnotations ifNil: [ self packageName ].
]

{ #category : #accessing }
FmxMBConfiguration >> packageNameForAnnotations: anObject [
	packageNameForAnnotations := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> prefix [
	^ prefix ifNil: [ prefix := '' ]
]

{ #category : #accessing }
FmxMBConfiguration >> prefix: anObject [
	prefix := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> traitTag [

	^ traitTag ifNil: [ traitTag := self defaultTraitTag ]
]

{ #category : #accessing }
FmxMBConfiguration >> traitTag: anObject [
	traitTag := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> wantsToGenerateImportingContext [
	^ wantsToGenerateImportingContext
]

{ #category : #accessing }
FmxMBConfiguration >> wantsToGenerateImportingContext: anObject [
	wantsToGenerateImportingContext := anObject
]
