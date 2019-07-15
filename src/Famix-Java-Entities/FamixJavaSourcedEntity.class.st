Class {
	#name : #FamixJavaSourcedEntity,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTWithComments + FamixTWithFiles + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithFiles classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaSourcedEntity class >> generatedSlotNames [
	<generated>
	'FamixJavaSourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaSourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithFiles FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FamixJavaSourcedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> accept: aVisitor [

	aVisitor visitEntity: self
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> addComment: aComment [
	self privateAddComment: aComment asFamixJavaComment
]

{ #category : #accessing }
FamixJavaSourcedEntity >> containerFiles [
	"this method returns a collection because a source entity can be defined in single as well as multiple files. Hence we support the language that allow the separation of declaration and definition"

	<MSEProperty: #containerFiles type: #FamixJavaFile>
	<multivalued>
	<MSEComment: 'List of files containing the entity'>
	"<container> -> should not be on this side..."
	
	^ self sourceAnchor ifNotNil: [ self sourceAnchor containerFiles ] ifNil: [ #() ]
]

{ #category : #accessing }
FamixJavaSourcedEntity >> containerFiles: aColl [
	"This method is a hack for now because we need an opposite to the files."

	
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> copyFrom: anEntity within: aVisitor [

	sourceAnchor := aVisitor visit: anEntity sourceAnchor.
	anEntity comments do: [:com | 
		self comments add: (aVisitor visit: com) ].

]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> defineMultiSourceAnchorWithPath: aPath [

	 self ensureMultiSourceAnchor addFileAnchorWithPath: aPath
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> ensureMultiSourceAnchor [
	"This method is also used by other packages"
	^self sourceAnchor
		ifNil: [ 
			self
				sourceAnchor:
					(FamixJavaMultipleFileAnchor new
						element: self;
						mooseModel: self mooseModel;
						yourself);
				sourceAnchor]
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
FamixJavaSourcedEntity >> isImplicitVariable [
	^false
]

{ #category : #'as yet unclassified' }
FamixJavaSourcedEntity >> numberOfJavaNullChecks [
	<MSEProperty: #numberOfJavaNullChecks type: #Number> <derived>
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
