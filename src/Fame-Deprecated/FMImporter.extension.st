Extension { #name : #FMImporter }

{ #category : #'*Fame-Deprecated' }
FMImporter >> nameTranslator [
	self deprecated: 'Use #translationUnit instead'.
	^ translationUnit dictionary
]

{ #category : #'*Fame-Deprecated' }
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

{ #category : #'*Fame-Deprecated' }
FMImporter >> repository [
	self deprecated: 'Use #model instead' transformWith: '`@receiver repository' -> '`@receiver model'.
	^ self model
]

{ #category : #'*Fame-Deprecated' }
FMImporter class >> repository: aModel [
	self deprecated: 'Use #model: instead' transformWith: '`@receiver repository: `@arg' -> '`@receiver model: `@arg'.
	^ self model: aModel
]

{ #category : #'*Fame-Deprecated' }
FMImporter >> repository: aModel [
	self deprecated: 'Use #model: instead' transformWith: '`@receiver repository: `@arg' -> '`@receiver model: `@arg'.
	^ self model: aModel
]
