Extension { #name : #Trait }

{ #category : #'*Moose-Core' }
Trait >> withMooseSubclasses [

	^ (self users flatCollect: [ :each | each withAllSubclasses ]) asSet

]
