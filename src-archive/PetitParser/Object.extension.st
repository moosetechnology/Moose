Extension { #name : #Object }

{ #category : #'*petitparser-core-converting' }
Object >> asParser [
	"Answer a parser accepting the receiving object."

	^ PPPredicateObjectParser expect: self
]

{ #category : #'*petitparser-core-testing' }
Object >> isPetitFailure [
	^ false
]

{ #category : #'*petitparser-core-testing' }
Object >> isPetitParser [
	^ false
]
