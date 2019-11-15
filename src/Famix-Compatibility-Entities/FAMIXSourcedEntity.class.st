Class {
	#name : #FAMIXSourcedEntity,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments + FamixTWithFiles',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait + FamixTWithFiles classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-SourceAnchor' }
FAMIXSourcedEntity >> fileAnchorPath: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FAMIXFileAnchor
				fileName: aString
				startLine: anInteger
				startColumn: anInteger2
				endLine: anInteger3
				endColumn: anInteger4
				model: self mooseModel)
]

{ #category : #'Famix-SourceAnchor' }
FAMIXSourcedEntity >> fileAnchorPath: aString startPos: anInteger endPos: anotherInteger [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FAMIXIndexedFileAnchor
				fileName: aString
				startPos: anInteger
				endPos: anotherInteger
				model: self mooseModel)
]

{ #category : #'Famix-Extensions' }
FAMIXSourcedEntity >> numberOfJavaNullChecks [
	<FMProperty: #numberOfJavaNullChecks type: #Number> <derived>
	^self
		lookUpPropertyNamed: #numberOfJavaNullChecks
		computedAs: [
			| nullCheckTextPatterns |
			nullCheckTextPatterns := #('== null' '!= null' 'null ==' 'null !=').
			(self sourceText allRegexMatches: ( '|' join: nullCheckTextPatterns)) size ]
]

{ #category : #accessing }
FAMIXSourcedEntity >> sourceLanguage [
	^ self sourceLanguageOr: FAMIXUnknownSourceLanguage
]

{ #category : #'Famix-Extensions' }
FAMIXSourcedEntity >> structuralChildren [ 
	^ #()
]
