Extension { #name : #FamixTWithSourceLanguages }

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguages >> formattedSourceText [
	^ self sourceLanguage 
		ifNotNil: [ :language | language format: self sourceText from: self ]
		ifNil: [ self sourceText ]
]

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguages >> sourceLanguage [
	"should be redefined"

	^ self sourceLanguageOr: FAMIXUnknownSourceLanguage
]
