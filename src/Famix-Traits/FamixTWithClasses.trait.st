Trait {
	#name : #FamixTWithClasses,
	#category : #'Famix-Traits-Class'
}

{ #category : #meta }
FamixTWithClasses classSide >> annotation [

	<MSEClass: #TWithClasses super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithClasses classSide >> generatedSlotNames [
	<generated>
	'FamixTWithClasses class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTWithClasses classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithClasses >> classes [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."
	<navigation: 'Classes'>

	^ self privateState 
				cacheAt: #classes 
				ifAbsentPut: [self types select: [:type| type isClass ]]
]
