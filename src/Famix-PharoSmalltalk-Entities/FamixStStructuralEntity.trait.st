Trait {
	#name : #FamixStStructuralEntity,
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Traits'
}

{ #category : #meta }
FamixStStructuralEntity classSide >> annotation [

	<MSEClass: #StructuralEntity super: #Trait>
	<generated>
	<package: #'Famix-PharoSmalltalk-Entities'>
	^self
]

{ #category : #testing }
FamixStStructuralEntity >> isSharedVariable [
	^ false
]
