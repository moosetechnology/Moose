Extension { #name : #FAMIXImplicitVariable }

{ #category : #'*Famix-Implementation' }
FAMIXImplicitVariable >> isImplicitVariable [
	^true
]

{ #category : #'*Famix-Implementation' }
FAMIXImplicitVariable >> isSelf [
	^ self name = #self
]

{ #category : #'*Famix-Implementation' }
FAMIXImplicitVariable >> isSuper [
	^ self name == #super
]

{ #category : #'*Famix-Implementation' }
FAMIXImplicitVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].

	self name ifNotNil: [ stream nextPutAll: self name ]
]

{ #category : #'*Famix-Implementation' }
FAMIXImplicitVariable >> printOn: aStream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ aStream nextPutAll: parent name.
		  aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (ImplicitVariable)'
]
