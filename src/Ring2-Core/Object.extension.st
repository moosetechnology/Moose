Extension { #name : #Object }

{ #category : #'*Ring2-Core' }
Object >> isRGObject [

	^ false
]

{ #category : #'*Ring2-Core' }
Object >> isRGUnresolvedValue [

	^ false
]

{ #category : #'*Ring2-Core' }
Object >> isRingFullyResolved [

	^ true
]

{ #category : #'*Ring2-Core' }
Object >> isRingFullyUnresolved [

	^ false
]

{ #category : #'*Ring2-Core' }
Object >> isRingResolved [

	^ true
]

{ #category : #'*Ring2-Core' }
Object >> orDefaultForUnresolved [

	^ self
]
