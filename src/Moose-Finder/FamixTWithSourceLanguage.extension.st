Extension { #name : #FamixTWithSourceLanguage }

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguage >> formattedSourceText [
	^ self sourceLanguage 
		ifNotNil: [ :language | language format: self sourceText from: self ]
		ifNil: [ self sourceText ]
]

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguage >> sourceLanguage [

	"should be redefined"
	^ nil
]

{ #category : #'*Moose-Finder' }
FamixTWithSourceLanguage >> sourceLanguageOr: unknownSourceLanguageClass [
	^ self declaredSourceLanguage ifNil: [
		self mooseModel 
			ifNil: [ unknownSourceLanguageClass new ] 
			ifNotNil: [ self mooseModel sourceLanguage ] ]
]
