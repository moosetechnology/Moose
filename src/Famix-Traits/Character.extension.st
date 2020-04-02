Extension { #name : #Character }

{ #category : #'*Famix-Traits' }
Character >> isCr [
	^ self asInteger = 13
]

{ #category : #'*Famix-Traits' }
Character >> isLf [
	^ self asInteger = 10
]
