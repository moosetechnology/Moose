Extension { #name : #FAMIXNamespace }

{ #category : #'*Famix-Implementation' }
FAMIXNamespace >> isNamespace [
	^ true
]

{ #category : #'*Famix-Implementation' }
FAMIXNamespace >> methods [
	^ self privateState 
			cacheAt: #methods 
			ifAbsentPut: [ 
				self classes flatCollect: #methods ]
]

{ #category : #'*Famix-Implementation' }
FAMIXNamespace >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream
			nextPut: $:;
			nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]

{ #category : #'*Famix-Implementation' }
FAMIXNamespace >> printOn: aStream [ 
	self belongsTo ifNotNil: [:parent |
		parent printOn: aStream.
		aStream
			nextPut: $:;
			nextPut: $: ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Namespace)'
]
