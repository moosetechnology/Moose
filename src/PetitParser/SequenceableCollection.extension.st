Extension { #name : #SequenceableCollection }

{ #category : #'*PetitParser' }
SequenceableCollection >> asPetitStream [
	^ PPStream on: self
]
