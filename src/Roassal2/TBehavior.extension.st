Extension { #name : #TBehavior }

{ #category : #'*Roassal2' }
TBehavior >> numberOfLinesOfCode [ 
	"Return the amount of lines of code"
	
	^ 5 + ((self rtmethods, self class rtmethods) inject: 0 into: [:sum :el | sum + el numberOfLinesOfCode ])
]
