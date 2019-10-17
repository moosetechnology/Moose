Extension { #name : #FMImporter }

{ #category : #'*Famix-Deprecated' }
FMImporter >> nameTranslator [
	self deprecated: 'Use #translationUnit instead'.
	^ translationUnit dictionary
]

{ #category : #'*Famix-Deprecated' }
FMImporter >> nameTranslator: anObject [
	self
		deprecated: 'Use FMDictionaryTranslationUnit instead'
		transformWith:
			'`@receiver nameTranslator: `@arg'
				->
			'`@receiver translationUnit: (FMDictionaryTranslationUnit new
													dictionary:  `@arg;
													yourself)'.
	translationUnit := FMDictionaryTranslationUnit new
		dictionary: anObject;
		yourself
]
