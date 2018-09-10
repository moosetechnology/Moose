Extension { #name : #FAMIXInheritance }

{ #category : #'*Famix-Implementation' }
FAMIXInheritance >> isInheritance [ 
	^true
]

{ #category : #'*Famix-Implementation' }
FAMIXInheritance >> mooseNameOn: aStream [
	self subclass ifNotNil: [ aStream nextPutAll: self subclass name ].
	aStream nextPutAll: ' -> '.
	self superclass ifNotNil: [ aStream nextPutAll: self superclass name ]
]

{ #category : #'*Famix-Implementation' }
FAMIXInheritance >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Inheritance)'
]
