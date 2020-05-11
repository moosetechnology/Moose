Trait {
	#name : #FamixTWithSourceLanguage,
	#instVars : [
		'#declaredSourceLanguage => FMOne type: #FamixTSourceLanguage opposite: #sourcedEntities'
	],
	#category : #'Famix-Traits-SourceLanguage'
}

{ #category : #meta }
FamixTWithSourceLanguage classSide >> annotation [

	<FMClass: #TWithSourceLanguage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithSourceLanguage >> declaredSourceLanguage [
	"Relation named: #declaredSourceLanguage type: #FamixTSourceLanguage opposite: #sourcedEntities"

	<generated>
	<FMComment: 'The declared SourceLanguage for the source code of this entity'>
	^ declaredSourceLanguage
]

{ #category : #accessing }
FamixTWithSourceLanguage >> declaredSourceLanguage: anObject [

	<generated>
	declaredSourceLanguage := anObject
]

{ #category : #testing }
FamixTWithSourceLanguage >> isUnknown [
	^ true
]

{ #category : #accessing }
FamixTWithSourceLanguage >> sourceLanguage [
	^ self sourceLanguageOr: self unknowSourceLanguageClass
]

{ #category : #accessing }
FamixTWithSourceLanguage >> sourceLanguageOr: unknownSourceLanguageClass [
	^ self declaredSourceLanguage ifNil: [
		self mooseModel 
			ifNil: [ unknownSourceLanguageClass new ] 
			ifNotNil: #sourceLanguage ]
]

{ #category : #accessing }
FamixTWithSourceLanguage >> unknowSourceLanguageClass [
	^ (self mooseDescription package
		classNamed: 'UnknownSourceLanguage'
		ifAbsent: [ self error: 'This entity has no source language, no model and no class implementing #FamixTUnknownSourceLanguage in it metamodel.' ])
		implementingClass
]
