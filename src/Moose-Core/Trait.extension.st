Extension { #name : #Trait }

{ #category : #'*Moose-Core' }
Trait >> inheritsFromType: aClassFAMIX [
	^ ({self} , self traits
		flatCollect: #withAllSuperclasses
		as: Set) includes: aClassFAMIX
]

{ #category : #'*Moose-Core' }
Trait >> withMooseSubclasses [

	^ (self users flatCollect: [ :each | each withAllSubclasses ]) asSet

]
