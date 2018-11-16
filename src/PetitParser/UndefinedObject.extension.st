Extension { #name : #UndefinedObject }

{ #category : #'*PetitParser' }
UndefinedObject >> asParser [
	"Answer a parser that succeeds and does not consume anything."
	
	^ PPEpsilonParser new
]
