Extension { #name : #UndefinedObject }

{ #category : #'*petitparser-converting' }
UndefinedObject >> asParser [
	"Answer a parser that succeeds and does not consume anything."
	
	^ PPEpsilonParser new
]
