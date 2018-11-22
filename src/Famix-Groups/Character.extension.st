Extension { #name : #Character }

{ #category : #'*Famix-Groups' }
Character >> isCr [
	^ self asInteger = 13
]

{ #category : #'*Famix-Groups' }
Character >> isLf [
	^ self asInteger = 10
]
