Extension { #name : #FM3Property }

{ #category : #'*fame-importexport' }
FM3Property >> accept: aVisitor [

	aVisitor visitProperty: self
]
