Extension { #name : #SystemDictionary }

{ #category : #'*Moose-Core' }
SystemDictionary >> absoluteName [
	"Answer an environment independent (and therefore truely unique) name."

	^ 'Smalltalk'
]

{ #category : #'*Moose-Core' }
SystemDictionary >> mooseName [
	
	^ #Smalltalk 
]
