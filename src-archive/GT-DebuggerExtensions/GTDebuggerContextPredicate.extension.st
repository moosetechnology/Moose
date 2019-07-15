Extension { #name : #GTDebuggerContextPredicate }

{ #category : #'*GT-DebuggerExtensions' }
GTDebuggerContextPredicate >> and: aPredicate [

	^ AndContextPredicate 
		with: self
		with: aPredicate
]

{ #category : #'*GT-DebuggerExtensions' }
GTDebuggerContextPredicate >> or: aPredicate [

	^ OrContextPredicate 
		with: self
		with: aPredicate
]
