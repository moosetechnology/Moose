Extension { #name : #FamixTPackage }

{ #category : #'*Famix-Deprecated' }
FamixTPackage >> childScopes [
	self
		deprecated: 'FamixTScopingEntites should not be used anymore. You should adapt your metamodel.'
		transformWith: '`@receiver childScopes' -> '`@receiver childEntities'.
	^ self childEntities
]

{ #category : #'*Famix-Deprecated' }
FamixTPackage >> childScopes: aCollection [
	self
		deprecated: 'FamixTScopingEntites should not be used anymore. You should adapt your metamodel.'
		transformWith: '`@receiver childScopes: `@arg' -> '`@receiver childEntities: `@arg'.
	^ self childEntities: aCollection
]

{ #category : #'*Famix-Deprecated' }
FamixTPackage >> parentScope [
	self
		deprecated: 'FamixTScopingEntites should not be used anymore. You should adapt your metamodel.'
		transformWith: '`@receiver parentScope' -> '`@receiver packageOwner'.
	^ self packageOwner
]

{ #category : #'*Famix-Deprecated' }
FamixTPackage >> parentScope: anEntity [
	self
		deprecated: 'FamixTScopingEntites should not be used anymore. You should adapt your metamodel.'
		transformWith: '`@receiver parentScope: `@arg' -> '`@receiver packageOwner: `@arg'.
	^ self packageOwner: anEntity
]
