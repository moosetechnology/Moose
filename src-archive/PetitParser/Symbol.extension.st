Extension { #name : #Symbol }

{ #category : #'*petitparser-core-converting' }
Symbol >> asParser [
	"Answer a predicate parser named after the receiving symbol. Possible symbols are the method selectors on the class-side of PPPredicateObjectParser."

	^ PPPredicateObjectParser perform: self
]
