Extension { #name : #Behavior }

{ #category : #'*Moose-Core' }
Behavior >> allUsers [
	^ #()
]

{ #category : #'*Moose-Core' }
Behavior >> mooseInheritsFrom: aClass [
	(self inheritsFrom: aClass) ifTrue: [ ^ true ].

	^ self usedStatefulTraits includes: aClass
]

{ #category : #'*Moose-Core' }
Behavior >> resetMooseEntityCache [
	"Do nothing here"
]

{ #category : #'*Moose-Core' }
Behavior >> usedStatefulTraits [
	^ self withAllSuperclasses flatCollect: [ :class | class allGeneratedTraits ] as: Set
]
