Extension { #name : #FAMIXAttribute }

{ #category : #'*Famix-Implementation' }
FAMIXAttribute >> accessingClasses [

	^(self accessingMethods collectAsSet: [:each | each belongsTo]) asOrderedCollection
]

{ #category : #'*Famix-Implementation' }
FAMIXAttribute >> accessingMethods [

	^ self incomingAccesses collectAsSet: [:anAccess | anAccess accessor].

]

{ #category : #'*Famix-Implementation' }
FAMIXAttribute >> isAttribute [
	^ true
]

{ #category : #'*Famix-Implementation' }
FAMIXAttribute >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
]

{ #category : #'*Famix-Implementation' }
FAMIXAttribute >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Attribute)'
]

{ #category : #'*Famix-Implementation' }
FAMIXAttribute >> readAccesses [
	
	^self incomingAccesses select: [:each | each isRead]
]
