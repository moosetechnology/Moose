Trait {
	#name : #FamixTWithModifiers,
	#traits : 'FamixTHasModifiers',
	#classTraits : 'FamixTHasModifiers classTrait',
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixTWithModifiers classSide >> annotation [
]

{ #category : #meta }
FamixTWithModifiers classSide >> isDeprecated [
	"TNamed was renamed #TNamedEntity. You should update your generator."

	^ true
]
