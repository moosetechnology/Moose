Extension { #name : #MooseIncomingQueryResult }

{ #category : #'*Famix-Deprecated' }
MooseIncomingQueryResult >> targetClasses [
	self deprecated: 'Use #targetsAtScope: instead' transformWith: '`@receiver targetClasses' -> '`@receiver targetsAtScope: FamixTClass'.
	^ self targetsAtScope: FamixTClass
]

{ #category : #'*Famix-Deprecated' }
MooseIncomingQueryResult >> targetMethods [
	self deprecated: 'Use #targetsAtScope: instead' transformWith: '`@receiver targetMethods' -> '`@receiver targetsAtScope: FamixTMethod'.
	^ self targetsAtScope: FamixTMethod
]
