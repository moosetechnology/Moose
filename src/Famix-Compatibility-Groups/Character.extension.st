Extension { #name : #Character }

{ #category : #'*Famix-Compatibility-Groups' }
Character >> isCr [
	^ self asInteger = 13
]

{ #category : #'*Famix-Compatibility-Groups' }
Character >> isLf [
	^ self asInteger = 10
]
