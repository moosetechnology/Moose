Extension { #name : #MooseEntity }

{ #category : #'*Famix-Tagging-Code' }
MooseEntity >> codeTagAssociations [
	"all interval tags associations placed on the pieces of code of this entity"

	^ self tagAssociations select: #isCodeTagAssociation
]

{ #category : #'*Famix-Tagging-Code' }
MooseEntity >> tagWith: aTag interval: anInterval sourceAnchor: sourceAnchor [
	^ aTag tagInterval: anInterval forEntity: self sourceAnchor: sourceAnchor
]
