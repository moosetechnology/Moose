Extension { #name : #Character }

{ #category : #'*petitparser-core-converting' }
Character >> asParser [
	"Answer a parser that accepts the receiving character."
	
	^ PPLiteralObjectParser on: self
]
