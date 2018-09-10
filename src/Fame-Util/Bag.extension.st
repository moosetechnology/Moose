Extension { #name : #Bag }

{ #category : #'*fame-util' }
Bag >> removeAllOccurrencesOf: element ifAbsent: exceptionBlock [ 
	contents removeKey: element ifAbsent: exceptionBlock
]
