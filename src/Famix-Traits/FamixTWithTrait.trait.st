Trait {
	#name : #FamixTWithTrait,
	#instVars : [
		'#traits => FMMany type: #FamixTTrait opposite: #traitOwner'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithTrait classSide >> annotation [

	<MSEClass: #TWithTrait super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #accessing }
FamixTWithTrait >> traits [

	<generated>
	^ traits
]

{ #category : #accessing }
FamixTWithTrait >> traits: anObject [

	<generated>
	traits value: anObject

]
