Extension { #name : #Context }

{ #category : #'*GT-GlamourDebugger' }
Context >> locateBrowserContext [

	^ (self findContextSuchThat:  [ :ctx | 
		(ctx receiver class inheritsFrom: GLMPresentation) " and: [ ctx selector = #startOn: ]" ]) 
]
