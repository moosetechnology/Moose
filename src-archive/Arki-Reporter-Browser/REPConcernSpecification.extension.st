Extension { #name : #REPConcernSpecification }

{ #category : #'*arki-reporter-browser' }
REPConcernSpecification >> open [ 
	^ REPConcernBrowser openOn: self root 
]
