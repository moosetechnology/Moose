Extension { #name : #MooseModel }

{ #category : #'*SmallDude-Moose-groups' }
MooseModel >> allDuplications [
	<navigation: 'All duplications'> 
	^self allWithType: DudeDuplication
]

{ #category : #'*SmallDude-Moose-groups' }
MooseModel >> allMultiplications [
	<navigation: 'All multiplications'> 
	^self allWithType: DudeMultiplication
]
