Extension { #name : #Metaclass }

{ #category : #'*Moose-Tests-SmalltalkImporter-Core' }
Metaclass >> absoluteName [
	"Answer an environment independent (and therefore truely unique) name."

	^ thisClass absoluteName , ' class'
]
