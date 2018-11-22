Extension { #name : #FamixModelExtractionTest }

{ #category : #'*Famix-Traits' }
FamixModelExtractionTest >> testAllFormalParameters [
	self
		assert: self model allParameters size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each parameters size ]).
	self
		assert: self model allParameters size
		equals: (self model allMethods flatCollect: [ :each | each parameters ]) size
]
