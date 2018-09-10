Extension { #name : #SequenceableCollection }

{ #category : #'*petitparser-core-converting' }
SequenceableCollection >> asPetitStream [
	^ PPStream on: self
]
