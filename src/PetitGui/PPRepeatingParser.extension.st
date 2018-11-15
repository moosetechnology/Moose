Extension { #name : #PPRepeatingParser }

{ #category : #'*PetitGui' }
PPRepeatingParser >> displayDescription [
	^ String streamContents: [ :stream |
		min = 0 
			ifFalse: [ stream print: min; nextPutAll: '..' ].
		max = SmallInteger maxVal
			ifTrue: [ stream nextPut: $* ]
			ifFalse: [ stream print: max ] ]
]

{ #category : #'*PetitGui' }
PPRepeatingParser >> exampleOn: aStream [
	"Perform the minimal repeatitions required, and a random amount of more if possible and if not that much output has been produced yet."
	
	min timesRepeat: [ 
		super exampleOn: aStream ].
	(max - min min: 5) atRandom timesRepeat: [
		aStream position > 512
			ifTrue: [ ^ self ].
		super exampleOn: aStream ]
]

{ #category : #'*PetitGui' }
PPRepeatingParser >> visualizationGraphType [
	^ '*'
]
