Extension { #name : #FAMIXInheritance }

{ #category : #'*moose-hismo' }
FAMIXInheritance >> historicalUniqueName [
	
	^(self subclass mooseName , '->' , self superclass mooseName) asSymbol
]
