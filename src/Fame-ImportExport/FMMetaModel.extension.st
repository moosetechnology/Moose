Extension { #name : #FMMetaModel }

{ #category : #'*Fame-ImportExport' }
FMMetaModel >> importStream: aReadStream [
	super importStream: aReadStream.
	self updateCache
]
