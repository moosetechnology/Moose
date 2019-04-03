Extension { #name : #Symbol }

{ #category : #'*moose-core' }
Symbol >> asSortBlock [

	^ [:a :b | (self value: a) <= (self value: b)]
]
