Extension { #name : #PPOptionalParser }

{ #category : #'*petitislands' }
PPOptionalParser >> acceptsEpsilon [
	^ true
]

{ #category : #'*petitislands' }
PPOptionalParser >> acceptsEpsilonOpenSet: set [
	^ true
]

{ #category : #'*petitislands' }
PPOptionalParser >> isIslandBorder [
	^ false
]

{ #category : #'*petitislands' }
PPOptionalParser >> isIslandBorderOpenSet: set [
	^ false
]
