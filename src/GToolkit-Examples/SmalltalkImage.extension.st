Extension { #name : #SmalltalkImage }

{ #category : #'*GToolkit-Examples-Core' }
SmalltalkImage >> gtExamplesContained [
	| examples |
	examples := OrderedCollection new.
	self allClassesAndTraitsDo: [ :class |
		class gtExamplesFactory examplesDo: [ :example | 
			examples add: example ] ].
	^ examples
]

{ #category : #'*GToolkit-Examples-Core' }
SmalltalkImage class >> gtExamplesFactory [
	^ super gtExamplesFactory
		provider: SmalltalkImage current;
		yourself
]
