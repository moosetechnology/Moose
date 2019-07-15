Extension { #name : #PPChoiceParser }

{ #category : #'*petitislands' }
PPChoiceParser >> acceptsEpsilonOpenSet: set [
	set add: self.
	^ self children anySatisfy: [:e | e acceptsEpsilonOpenSet: set ].
]

{ #category : #'*petitislands' }
PPChoiceParser >> isIslandBorderOpenSet: set [
	set add: self.
	^ self children allSatisfy: [:e | e isIslandBorderOpenSet: set ].
]
