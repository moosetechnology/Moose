Extension { #name : #Fraction }

{ #category : #'*Fame-ImportExport' }
Fraction >> msePrintOn: stream [
	self asFloat msePrintOn: stream
]
