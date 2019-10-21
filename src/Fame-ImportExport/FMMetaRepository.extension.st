Extension { #name : #FMMetaRepository }

{ #category : #'*Fame-ImportExport' }
FMMetaRepository >> importStream: aReadStream [
	super importStream: aReadStream.
	self updateCache
]
