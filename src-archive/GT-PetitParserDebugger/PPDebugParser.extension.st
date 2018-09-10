Extension { #name : #PPDebugParser }

{ #category : #'*GT-PetitParserDebugger' }
PPDebugParser >> debugRoot [
	"Assume PPDebugParser contains a wrapping parser."	
	^ self children first children first
]
