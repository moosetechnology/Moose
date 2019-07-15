Extension { #name : #PPEpsilonParser }

{ #category : #'*petitislands' }
PPEpsilonParser >> acceptsEpsilon [
	^ true
]

{ #category : #'*petitislands' }
PPEpsilonParser >> isIslandBorder [
	^ false
]

{ #category : #'*petitislands' }
PPEpsilonParser >> nonEmpty [
	^ PPFailingParser message: 'epsilon is always empty'
]
