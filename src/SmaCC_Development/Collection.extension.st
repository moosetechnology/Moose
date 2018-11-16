Extension { #name : #Collection }

{ #category : #'*SmaCC_Development' }
Collection >> smaccIntersect: aCollection [
	^ self select: [ :each | aCollection includes: each ]
]

{ #category : #'*SmaCC_Development' }
Collection >> smaccRemoveAll: aCollection [
	aCollection do: [ :each | self remove: each ifAbsent: [  ] ].
	^ aCollection
]
