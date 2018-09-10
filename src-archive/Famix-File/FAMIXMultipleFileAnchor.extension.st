Extension { #name : #FAMIXMultipleFileAnchor }

{ #category : #'*Famix-File' }
FAMIXMultipleFileAnchor >> addToFile: entity [
	^ self allFiles do: [ :each | each addToFile: entity ]
]

{ #category : #'*Famix-File' }
FAMIXMultipleFileAnchor >> containerFiles [
	^ self propertyNamed: #containerFiles ifAbsentPut: [ self allFiles collect: #correspondingFile thenReject: #isNil ]
]
