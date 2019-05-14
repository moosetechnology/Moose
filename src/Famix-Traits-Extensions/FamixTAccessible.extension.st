Extension { #name : #FamixTAccessible }

{ #category : #'*Famix-Traits-Extensions' }
FamixTAccessible >> accessors [
	<MSEProperty: #accessors type: #FamixTWithAccesses>
	<multivalued>
	<derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]
