Extension { #name : #FAMIXPackage }

{ #category : #'*Famix-Implementation' }
FAMIXPackage >> abstractClasses [

	^ self classes select: [:c | c isAbstract]
]

{ #category : #'*Famix-Implementation' }
FAMIXPackage >> classes [

	^ self privateState 	cacheAt: #classes 
							ifAbsentPut: [ childNamedEntities select: [ :child | child isClass ]]
]

{ #category : #'*Famix-Implementation' }
FAMIXPackage >> methods [
	^ self localMethods union: self extensionMethods
]

{ #category : #'*Famix-Implementation' }
FAMIXPackage >> printOn: aStream [ 
	| parent |
	parent := self parentPackage.
	parent ifNotNil: 
		[ parent printOn: aStream.
		aStream
			nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Package)'
]
