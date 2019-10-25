Extension { #name : #FM3Package }

{ #category : #'*fame-importexport' }
FM3Package >> accept: aVisitor [

	aVisitor visitFM3PackageDescription: self
]
