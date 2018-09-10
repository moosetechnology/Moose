Extension { #name : #PP2FirstSetVisitor }

{ #category : #'*PetitJava' }
PP2FirstSetVisitor >> visitJavaWhitespace: node [
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	returnSet := self setWithPossible: node.
	
	returnSet addAll: (self visit: #space asPParser).
	returnSet addAll: (self visit: $/ asPParser).
	
	^ returnSet
]
