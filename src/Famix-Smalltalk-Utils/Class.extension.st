Extension { #name : #Class }

{ #category : #'*Famix-Smalltalk-Utils' }
Class >> mooseName [
	"asnwer the full moose name"

	^ ('Smalltalk::' , self name) asSymbol
]
