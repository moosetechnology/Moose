Extension { #name : #MASingleOptionDescription }

{ #category : #'*Magritte-Morph' }
MASingleOptionDescription class >> defaultMorphClasses [
	^ Array
			with: MASingleSelectListMorph
			with: MADropListMorph
]
