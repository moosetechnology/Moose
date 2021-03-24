Extension { #name : #FamixTWithSourceLanguages }

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguages >> formattedSourceText [

	^ self sourceLanguage
		  ifNotNil: [ :language | 
		  language format: self sourceText from: self ]
		  ifNil: [ self sourceText ]
]
