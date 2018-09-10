Extension { #name : #Context }

{ #category : #'*GToolkit-Examples-Core' }
Context class >> gtExamplesFactory [
	^ super gtExamplesFactory
		provider: self;
		yourself
]
