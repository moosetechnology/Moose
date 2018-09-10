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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithSourceLanguage classSide >> generatedSlotNames [
	<generated>
	'FamixTWithSourceLanguage class>>#generatedSlotNames'.
	^ #(declaredSourceLanguage)
]

{ #category : #generator }
FamixTWithSourceLanguage classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithSourceLanguage >> declaredSourceLanguage [

	<generated>
	<MSEComment: 'The declared SourceLanguage for the source code of this entity'>
	^ declaredSourceLanguage
]

{ #category : #accessing }
FamixTWithSourceLanguage >> declaredSourceLanguage: anObject [

	<generated>
	declaredSourceLanguage := anObject

]
