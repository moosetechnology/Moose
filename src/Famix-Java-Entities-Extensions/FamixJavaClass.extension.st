Extension { #name : #FamixJavaClass }

{ #category : #'*Famix-Java-Entities-Extensions' }
FamixJavaClass >> isInterface [

	<MSEProperty: #isInterface type: #Boolean>
	<MSEComment: 'This is a boolean flag used to distinguish between classes with implementation and interfaces'>

	^ self privateState attributeAt: #isInterface ifAbsent: [ false ]
]

{ #category : #'*Famix-Java-Entities-Extensions' }
FamixJavaClass >> isInterface: aBoolean [

	^ self privateState attributeAt: #isInterface put: true
]
