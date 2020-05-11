Extension { #name : #FamixTSourceLanguage }

{ #category : #'*Famix-CommentAnalyzer' }
FamixTSourceLanguage >> commentMarkers [
	^ self subclassResponsibility
]

{ #category : #'*Famix-CommentAnalyzer' }
FamixTSourceLanguage >> languageKeywords [
	"Should return the keywords of the current language."

	^ self subclassResponsibility
]
