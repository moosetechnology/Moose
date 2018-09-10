Extension { #name : #FAMIXAccess }

{ #category : #'*Famix-Implementation' }
FAMIXAccess >> isAccess [ 
	^true
]

{ #category : #'*Famix-Implementation' }
FAMIXAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
