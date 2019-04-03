Extension { #name : #AbstractBinaryFileStream }

{ #category : #'*Moose-Core' }
AbstractBinaryFileStream >> localName [
	^ self file basename copyAfterLast: DiskStore delimiter
]
