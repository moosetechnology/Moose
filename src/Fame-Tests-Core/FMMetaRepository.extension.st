Extension { #name : #FMMetaRepository }

{ #category : #'*Fame-Tests-Core' }
FMMetaRepository >> addSmalltalkClasses: classes [ 
	| builder |
	builder := FMPragmaProcessor new.
	builder queue: classes.
	builder run.
	self addAll: builder elements
]
