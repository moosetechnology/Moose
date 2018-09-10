Extension { #name : #Set }

{ #category : #'*moose-finder' }
Set >> mooseInterestingEntity [ 
	"For a group with one element,  it returns that element, instead of the group, useful in the finder to remove extra step when navigating"

	^self size = 1 
		ifTrue: [ self anyOne ] 
		ifFalse: [ self asMooseGroup ]
]
