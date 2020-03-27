Trait {
	#name : #FamixTWithModifiers,
	#traits : 'FamixTHasModifiers',
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
