Extension { #name : #Class }

{ #category : #'*Moose-Tests-SmalltalkImporter-Core' }
Class >> absoluteName [
	"Answer an environment independent (and therefore truely unique) name."

	<localClassMethod> 
    "This method is supposed to be local in Class because of a good reason.
    We use this pragma to test if Class does not contain some accidental 
    local selectors."

	^ self name asString
]

{ #category : #'*Moose-Tests-SmalltalkImporter-Core' }
Class >> mooseNameOf: aString [
	"utility method for concatenating strings to a basic mooseName"

	<localClassMethod> 
    "This method is supposed to be local in Class because of a good reason.
    We use this pragma to test if Class does not contain some accidental 
    local selectors."

	^ (self mooseName, '.', aString) asSymbol
]
