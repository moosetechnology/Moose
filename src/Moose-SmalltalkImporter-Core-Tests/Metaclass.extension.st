Extension { #name : #Metaclass }

{ #category : #'*Moose-SmalltalkImporter-Core-Tests' }
Metaclass >> absoluteName [
	"Answer an environment independent (and therefore truely unique) name."

	^ thisClass absoluteName , ' class'
]
