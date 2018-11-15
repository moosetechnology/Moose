Extension { #name : #String }

{ #category : #'*PetitParser' }
String >> asParser [
	"Answer a parser that accepts the receiving string."

	^ PPLiteralSequenceParser on: self
]
