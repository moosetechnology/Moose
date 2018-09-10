Extension { #name : #Behavior }

{ #category : #'*Roassal2' }
Behavior >> numberOfLinesOfCode [ 
	"Return the amount of lines of code"
	
	^ 5 + ((self rtmethods, self class rtmethods) inject: 0 into: [:sum :el | sum + el numberOfLinesOfCode ])
]

{ #category : #'*Roassal2' }
Behavior >> numberOfVariables [
	"Return the number of variables"
	
	^ self instVarNames size
]
