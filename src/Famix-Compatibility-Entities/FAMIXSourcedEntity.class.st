Class {
	#name : #FAMIXSourcedEntity,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTWithComments + FamixTWithFiles + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithFiles classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXSourcedEntity class >> generatedSlotNames [
	<generated>
	'FAMIXSourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXSourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithFiles FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FAMIXSourcedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXSourcedEntity >> accept: aVisitor [

	aVisitor visitEntity: self
]

{ #category : #accessing }
FAMIXSourcedEntity >> addComment: aComment [
		self privateAddComment: aComment asFAMIXComment
]

{ #category : #'Famix-File' }
FAMIXSourcedEntity >> containerFiles [
	"this method returns a collection because a source entity can be defined in single as well as multiple files. Hence we support the language that allow the separation of declaration and definition"

	<MSEProperty: #containerFiles type: #FAMIXFile>
	<multivalued>
	<MSEComment: 'List of files containing the entity'>
	"<container> -> should not be on this side..."
	
	^ self sourceAnchor ifNotNil: [ self sourceAnchor containerFiles ] ifNil: [ #() ]
]

{ #category : #'Famix-File' }
FAMIXSourcedEntity >> containerFiles: aColl [
	"This method is a hack for now because we need an opposite to the files."

	
]

{ #category : #'Famix-Extensions' }
FAMIXSourcedEntity >> copyFrom: anEntity within: aVisitor [

	sourceAnchor := aVisitor visit: anEntity sourceAnchor.
	anEntity comments do: [:com | 
		self comments add: (aVisitor visit: com) ].

]

{ #category : #'Famix-SourceAnchor' }
FAMIXSourcedEntity >> defineMultiSourceAnchorWithPath: aPath [

	 self ensureMultiSourceAnchor addFileAnchorWithPath: aPath
]

{ #category : #'Famix-SourceAnchor' }
FAMIXSourcedEntity >> ensureMultiSourceAnchor [
	"This method is also used by other packages"
	^self sourceAnchor
		ifNil: [ 
			self
				sourceAnchor:
					(FAMIXMultipleFileAnchor new
						element: self;
						mooseModel: self mooseModel;
						yourself);
				sourceAnchor]
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

{ #category : #'Famix-Implementation' }
FAMIXSourcedEntity >> isImplicitVariable [
	^false
]

{ #category : #'Famix-Extensions' }
FAMIXSourcedEntity >> numberOfJavaNullChecks [
	<MSEProperty: #numberOfJavaNullChecks type: #Number> <derived>
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
