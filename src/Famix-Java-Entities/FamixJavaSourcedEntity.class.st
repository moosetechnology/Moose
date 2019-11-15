Class {
	#name : #FamixJavaSourcedEntity,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments + FamixTWithFiles',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait + FamixTWithFiles classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> fileAnchorPath: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FamixJavaFileAnchor
				fileName: aString
				startLine: anInteger
				startColumn: anInteger2
				endLine: anInteger3
				endColumn: anInteger4
				model: self mooseModel)
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> fileAnchorPath: aString startPos: anInteger endPos: anotherInteger [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FamixJavaIndexedFileAnchor
				fileName: aString
				startPos: anInteger
				endPos: anotherInteger
				model: self mooseModel)
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> numberOfJavaNullChecks [
	<FMProperty: #numberOfJavaNullChecks type: #Number> <derived>
	^self
		lookUpPropertyNamed: #numberOfJavaNullChecks
		computedAs: [
			| nullCheckTextPatterns |
			nullCheckTextPatterns := #('== null' '!= null' 'null ==' 'null !=').
			(self sourceText allRegexMatches: ( '|' join: nullCheckTextPatterns)) size ]
]

{ #category : #accessing }
FamixJavaSourcedEntity >> sourceLanguage [
	^ self sourceLanguageOr: FamixJavaUnknownSourceLanguage
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> structuralChildren [ 
	^ #()
]
