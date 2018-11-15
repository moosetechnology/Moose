Extension { #name : #BlockClosure }

{ #category : #'*PetitParser' }
BlockClosure >> asParser [
	"Answer a parser implemented in the receiving one-argument block."

	^ PPPluggableParser on: self
]
