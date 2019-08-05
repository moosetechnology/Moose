Extension { #name : #Trait }

{ #category : #'*Moose-Core' }
Trait >> allUsers [
	^ self users asOrderedCollection , (self users asOrderedCollection select: #isTrait thenCollect: #allUsers)
]

{ #category : #'*Moose-Core' }
Trait >> withMooseSubclasses [

	^ (self users flatCollect: [ :each | each withAllSubclasses ]) asSet

]
