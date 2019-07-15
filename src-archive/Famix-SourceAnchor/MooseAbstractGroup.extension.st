Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-SourceAnchor' }
MooseAbstractGroup >> allFileAnchors [
	^self allWithSubTypesOf: FamixFileAnchor
]
