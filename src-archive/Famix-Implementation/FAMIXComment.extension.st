Extension { #name : #FAMIXComment }

{ #category : #'*Famix-Implementation' }
FAMIXComment >> belongsTo [
	
	^ self container
]

{ #category : #'*Famix-Implementation' }
FAMIXComment >> printOn: aStream [
	self sourceText ifNotNil: [ :sourceText | aStream nextPutAll: (sourceText contractTo: 50) ].
	aStream nextPutAll: ' (comment on '.
	self container printOn: aStream.
	aStream nextPut: $)
]
