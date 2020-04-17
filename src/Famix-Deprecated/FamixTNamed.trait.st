Trait {
	#name : #FamixTNamed,
	#traits : 'FamixTNamedEntity',
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixTNamed classSide >> annotation [
]

{ #category : #testing }
FamixTNamed classSide >> isDeprecated [
	"TNamed was renamed #TNamedEntity. You should update your generator."

	^ true
]
