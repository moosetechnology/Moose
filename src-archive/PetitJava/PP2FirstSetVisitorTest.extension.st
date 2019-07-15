Extension { #name : #PP2FirstSetVisitorTest }

{ #category : #'*PetitJava' }
PP2FirstSetVisitorTest >> testVisitJavaWhitespace [
	parser := PPJavaWhitespaceParser new.
	
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 2.
	self assert: (firstSet anySatisfy: [:e | (e parse: String space) isPetit2Success ]).
	self assert: (firstSet anySatisfy: [:e | (e parse: String tab) isPetit2Success ]).
	self assert: (firstSet anySatisfy: [:e | (e parse: String crlf) isPetit2Success ]).
	
	self assert: (firstSet anySatisfy: [:e | (e parse: $/ asString) isPetit2Success ]).
]
