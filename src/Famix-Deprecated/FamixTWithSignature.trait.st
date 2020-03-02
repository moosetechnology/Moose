Trait {
	#name : #FamixTWithSignature,
	#traits : 'FamixTHasSignature',
	#classTraits : 'FamixTHasSignature classTrait',
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixTWithSignature classSide >> annotation [
]

{ #category : #meta }
FamixTWithSignature classSide >> isDeprecated [
	"TNamed was renamed #TNamedEntity. You should update your generator."

	^ true
]
