Extension { #name : #FAMIXContainerEntity }

{ #category : #'*Famix-Implementation' }
FAMIXContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : #'*Famix-Implementation' }
FAMIXContainerEntity >> classes [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."
	<navigation: 'Classes'>

	^ self privateState 
				cacheAt: #classes 
				ifAbsentPut: [self types select: [:type| type isClass ]]
]

{ #category : #'*Famix-Implementation' }
FAMIXContainerEntity >> isContainerEntity [
	^ true
]
