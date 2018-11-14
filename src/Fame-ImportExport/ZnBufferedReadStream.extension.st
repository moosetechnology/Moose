Extension { #name : #ZnBufferedReadStream }

{ #category : #'*Fame-ImportExport' }
ZnBufferedReadStream >> localName [
	^ self wrappedStream localName
]
