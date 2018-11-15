Extension { #name : #PPEpsilonParser }

{ #category : #'*PetitGui' }
PPEpsilonParser >> displayName [
	^ 'epsilon'
]

{ #category : #'*PetitGui' }
PPEpsilonParser >> morphicShapeSeen: aSet depth: anInteger [
	^ self morphicShapeSeen: aSet depth: anInteger do: [ :cc |
		self newRowMorph
			addMorphBack: (self newColumnMorph
				addMorphBack: (self newSpacerMorph height: 10);
				addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1);
				yourself);
			yourself ]
]
