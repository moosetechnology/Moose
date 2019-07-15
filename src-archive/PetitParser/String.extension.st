Extension { #name : #String }

{ #category : #'*petitparser-core-converting' }
String >> asParser [
	"Answer a parser that accepts the receiving string."

	^ PPLiteralSequenceParser on: self
]
