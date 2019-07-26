Extension { #name : #MooseEntity }

{ #category : #'*Moose-Query' }
MooseEntity class >> inheritsFromType: aClassFAMIX [
	^ ({self} , self usedStatefulTraits flatCollect: #withAllSuperclasses as: Set) includes: aClassFAMIX
]
