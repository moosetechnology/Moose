Extension { #name : #BlockClosure }

{ #category : #'*Roassal2' }
BlockClosure >> initializeElement: aRTElement [ 
	self value: aRTElement 
]

{ #category : #'*Roassal2-Core' }
BlockClosure >> rtValue: valueOrArray [
	self numArgs = 0 ifTrue: [ ^ self value ].  
	self numArgs = 1 ifTrue: [ ^ self value: valueOrArray ].
	
	"if I have more than 1 argument, then the valueOrArray is a collection"
	valueOrArray isCollection ifFalse: [ self error: 'A block with more than one argument can only be evaluated with a collection ' ].
	
	self numArgs = valueOrArray size ifTrue: [ ^ self valueWithArguments: valueOrArray ]. 
	
	self error: 'Incorrect number of arguments'

]
