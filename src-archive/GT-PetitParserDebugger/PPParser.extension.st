Extension { #name : #PPParser }

{ #category : #'*GT-PetitParserDebugger' }
PPParser >> debugRoot [

	^ self
]

{ #category : #'*GT-PetitParserDebugger' }
PPParser >> fullDebug: anObject [

	^ self debug: (PPBrowserStream on: anObject)
]

{ #category : #'*GT-PetitParserDebugger' }
PPParser class >> productionSelectors [

	^ #()
]
