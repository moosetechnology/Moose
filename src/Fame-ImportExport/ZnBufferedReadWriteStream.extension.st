Extension { #name : #ZnBufferedReadWriteStream }

{ #category : #'*Fame-ImportExport' }
ZnBufferedReadWriteStream >> localName [
	^ self wrappedStream localName
]
