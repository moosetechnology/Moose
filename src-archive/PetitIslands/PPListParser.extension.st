Extension { #name : #PPListParser }

{ #category : #'*petitislands' }
PPListParser >> acceptsEpsilon [
	^ self acceptsEpsilonOpenSet: IdentitySet new.
]

{ #category : #'*petitislands' }
PPListParser >> isIslandBorder [
	^ self isIslandBorderOpenSet: IdentitySet new
]
