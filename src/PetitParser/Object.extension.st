Extension { #name : #Object }

{ #category : #'*PetitParser' }
Object >> asParser [
	"Answer a parser accepting the receiving object."

	^ PPPredicateObjectParser expect: self
]

{ #category : #'*PetitParser' }
Object >> isPetitFailure [
	^ false
]

{ #category : #'*PetitParser' }
Object >> isPetitParser [
	^ false
]
