Extension { #name : #FAMIXFileGroup }

{ #category : #'*SmallDude-Moose-ui' }
FAMIXFileGroup >> allMultiplications [
	<navigation: 'All multiplications'>
	| all |
	all := self mooseModel allMultiplications.
	^ all notEmpty
		ifTrue: [ all selectWhereAnyFragment: [ :frag | self includes: frag entity modelEntity ] ]
		ifFalse: [ MooseGroup new ]
]

{ #category : #'*SmallDude-Moose-ui' }
FAMIXFileGroup >> computeDuplication [ 
	 
	<menuItem: 'Compute duplication' category: #SmallDude> 
	super computeDuplication
]
