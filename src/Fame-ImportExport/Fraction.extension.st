Extension { #name : #Fraction }

{ #category : #'*Fame-ImportExport' }
Fraction >> fm3PrintOn: stream [
	self asFloat fm3PrintOn: stream
]
