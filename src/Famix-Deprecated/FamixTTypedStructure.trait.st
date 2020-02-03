Trait {
	#name : #FamixTTypedStructure,
	#traits : 'FamixTTypedEntity',
	#classTraits : 'FamixTTypedEntity classTrait',
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixTTypedStructure classSide >> annotation [
]

{ #category : #testing }
FamixTTypedStructure classSide >> isDeprecated [
	"TTypedStructure was renamed #TTypedEntity. You should update your generator."

	^ true
]
