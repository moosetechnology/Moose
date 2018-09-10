Extension { #name : #FAMIXAttribute }

{ #category : #'*Famix-Smalltalk' }
FAMIXAttribute >> beInstanceVariable [

	self propertyNamed: #sharedVariable put: false 
]

{ #category : #'*Famix-Smalltalk' }
FAMIXAttribute >> beProtected [
	^ self isProtected: true
]

{ #category : #'*Famix-Smalltalk' }
FAMIXAttribute >> beSharedVariable [

	self propertyNamed: #sharedVariable put: true 
]

{ #category : #'*Famix-Smalltalk' }
FAMIXAttribute >> isSharedVariable [

	"^ self propertyNamed: #sharedVariable ifAbsent: [false] "
	^ self propertyNamed: #sharedVariable ifNil: [false]
]
