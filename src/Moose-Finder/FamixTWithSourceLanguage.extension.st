Extension { #name : #FamixTWithSourceLanguage }

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguage >> formattedSourceText [
	^ self sourceLanguage 
		ifNotNil: [ :language | language format: self sourceText from: self ]
		ifNil: [ self sourceText ]
]

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguage >> sourceLanguage [
	"We are looking for the UnknownSourceLanguage in the metamodel"

	^ self
		sourceLanguageOr:
			(self mooseModel metamodel classes
				detect: [ :e | 
					(e implementingClass traits includes: FamixTSourceLanguage)
						and: [ e implementingClass new isUnknown ] ]) implementingClass
]
