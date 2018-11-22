Extension { #name : #Bag }

{ #category : #'*Fame-ImportExport' }
Bag >> removeAllOccurrencesOf: element ifAbsent: exceptionBlock [ 
	contents removeKey: element ifAbsent: exceptionBlock
]
