Trait {
	#name : #FamixTUnknownSourceLanguage,
	#category : #'Famix-Traits-SourceLanguage'
}

{ #category : #meta }
FamixTUnknownSourceLanguage classSide >> annotation [

	<MSEClass: #TUnknownSourceLanguage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTUnknownSourceLanguage >> isUnknown [
	^ true
]
