Extension { #name : #MAContainer }

{ #category : #'*Magritte-Morph' }
MAContainer >> asMorphOn: anObject [
	^ self morphClass
		memento: (anObject mementoClass
			model: anObject
			description: self)
]

{ #category : #'*Magritte-Morph' }
MAContainer class >> defaultMorphClasses [
	^ Array with: MAContainerMorph
]
