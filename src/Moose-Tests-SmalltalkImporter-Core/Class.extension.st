Extension { #name : #Class }

{ #category : #'*Moose-Tests-SmalltalkImporter-Core' }
Class >> absoluteName [
	"Answer an environment independent (and therefore truely unique) name."

	^ self name asString
]

{ #category : #'*Moose-Tests-SmalltalkImporter-Core' }
Class >> mooseNameOf: aString [
	"utility method for concatenating strings to a basic mooseName"

	^ (self mooseName , '.' , aString) asSymbol
]
