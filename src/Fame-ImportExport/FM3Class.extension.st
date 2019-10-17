Extension { #name : #FM3Class }

{ #category : #'*fame-importexport' }
FM3Class >> accept: aVisitor [
	aVisitor visitFM3MetaDescription: self
]
