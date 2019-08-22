Trait {
	#name : #FamixTWithSourceLanguage,
	#instVars : [
		'#declaredSourceLanguage => FMOne type: #FamixTSourceLanguage opposite: #sourcedEntities'
	],
	#category : #'Famix-Traits-SourceLanguage'
}

{ #category : #meta }
FamixTWithSourceLanguage classSide >> annotation [

	<MSEClass: #TWithSourceLanguage super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithSourceLanguage >> declaredSourceLanguage [

	<generated>
	<MSEComment: 'The declared SourceLanguage for the source code of this entity'>
	"Relation named: #declaredSourceLanguage type: #FamixTSourceLanguage opposite: #sourcedEntities"

	^ declaredSourceLanguage
]

{ #category : #accessing }
FamixTWithSourceLanguage >> declaredSourceLanguage: anObject [

	<generated>
	declaredSourceLanguage := anObject

]

{ #category : #accessing }
FamixTWithSourceLanguage >> sourceLanguageOr: unknownSourceLanguageClass [
	^ self declaredSourceLanguage ifNil: [
		self mooseModel 
			ifNil: [ unknownSourceLanguageClass new ] 
			ifNotNil: [ self mooseModel sourceLanguage ] ]
]
