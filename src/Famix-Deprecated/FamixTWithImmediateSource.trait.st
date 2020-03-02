Trait {
	#name : #FamixTWithImmediateSource,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixTWithImmediateSource classSide >> annotation [
]

{ #category : #meta }
FamixTWithImmediateSource classSide >> isDeprecated [
	"TNamed was renamed #TNamedEntity. You should update your generator."

	^ true
]
