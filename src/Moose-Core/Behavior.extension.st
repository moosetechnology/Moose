Extension { #name : #Behavior }

{ #category : #'*Moose-Core' }
Behavior >> mooseInheritsFrom: aClass [
	(self inheritsFrom: aClass) ifTrue: [ ^ true ].
	(self allGeneratedTraits includes: aClass) ifTrue: [ ^ true ].

	^ self allSuperclasses anySatisfy: [ :each | each allGeneratedTraits includes: aClass ]
]
