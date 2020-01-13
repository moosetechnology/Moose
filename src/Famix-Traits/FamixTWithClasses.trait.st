Trait {
	#name : #FamixTWithClasses,
	#category : #'Famix-Traits-Class'
}

{ #category : #meta }
FamixTWithClasses classSide >> annotation [

	<FMClass: #TWithClasses super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithClasses >> classes [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."
	<navigation: 'Classes'>

	^ self privateState 
				cacheAt: #classes 
				ifAbsentPut: [self types select: [:type| type isClass ]]
]
