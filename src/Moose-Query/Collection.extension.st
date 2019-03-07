Extension { #name : #Collection }

{ #category : #'*Moose-Query' }
Collection >> allAtAnyScope: aCollectionOfFamixClasses in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allAtAnyScope: aCollectionOfFamixClasses in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> allAtScope: aFAMIXScope in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allAtScope: aFAMIXScope in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> allToAnyScope: aCollectionOfFamixClasses in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allToAnyScope: aCollectionOfFamixClasses in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> allToScope: aFAMIXScope in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allToScope: aFAMIXScope in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> allWithScope: aFAMIXScope in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allWithScope: aFAMIXScope in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> atAnyScope: aCollectionOfFamixScopes in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) atAnyScope: aCollectionOfFamixScopes in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> atScope: aFAMIXScope in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) atScope: aFAMIXScope in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> toAnyScope: aCollectionOfFamixClasses in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) toAnyScope: aCollectionOfFamixClasses in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> toScope: aFAMIXScope in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) toScope: aFAMIXScope in: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> withScope: aFAMIXScope in: aCollection [
	1 to: self size do: [ :ind | (self at: ind) withScope: aFAMIXScope in: aCollection ].
	^ aCollection
]
