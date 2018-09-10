Extension { #name : #Character }

{ #category : #'*Famix-SourceAnchor' }
Character >> isCr [
	^ self asInteger = 13
]

{ #category : #'*Famix-SourceAnchor' }
Character >> isLf [
	^ self asInteger = 10
]
