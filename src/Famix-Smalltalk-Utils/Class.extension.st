Extension { #name : #Class }

{ #category : #'*Famix-Smalltalk-Utils' }
Class >> mooseName [
	"asnwer the full moose name"

	<localClassMethod> 
    "This method is supposed to be local in Class because of a good reason.
    We use this pragma to test if Class does not contain some accidental 
    local selectors."

	^ ('Smalltalk::', self name) asSymbol
]
