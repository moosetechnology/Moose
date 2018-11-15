Extension { #name : #Object }

{ #category : #'*PetitParser' }
Object >> asParser [
	"Answer a parser accepting the receiving object."

	^ PPPredicateObjectParser expect: self
]

{ #category : #'*petitparser-core-testing' }
Object >> isPetitFailure [
	^ false
]

{ #category : #'*PetitParser' }
Object >> isPetitParser [
	^ false
]
