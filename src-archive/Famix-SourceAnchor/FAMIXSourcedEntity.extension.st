Extension { #name : #FAMIXSourcedEntity }

{ #category : #'*Famix-SourceAnchor' }
FAMIXSourcedEntity >> defineMultiSourceAnchorWithPath: aPath [

	 self ensureMultiSourceAnchor addFileAnchorWithPath: aPath
]

{ #category : #'*Famix-SourceAnchor' }
FAMIXSourcedEntity >> ensureMultiSourceAnchor [
	"This method is also used by other packages"
	^self sourceAnchor
		ifNil: [ 
			self
				sourceAnchor:
					(FamixMultipleFileAnchor new
						element: self;
						mooseModel: self mooseModel;
						yourself);
				sourceAnchor]
]

{ #category : #'*Famix-SourceAnchor' }
FAMIXSourcedEntity >> fileAnchorPath: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FamixFileAnchor
				fileName: aString
				startLine: anInteger
				startColumn: anInteger2
				endLine: anInteger3
				endColumn: anInteger4
				model: self mooseModel)
]

{ #category : #'*Famix-SourceAnchor' }
FAMIXSourcedEntity >> fileAnchorPath: aString startPos: anInteger endPos: anotherInteger [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FamixIndexedFileAnchor
				fileName: aString
				startPos: anInteger
				endPos: anotherInteger
				model: self mooseModel)
]
