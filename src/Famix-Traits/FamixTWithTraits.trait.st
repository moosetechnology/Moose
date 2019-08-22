Trait {
	#name : #FamixTWithTraits,
	#instVars : [
		'#traits => FMMany type: #FamixTTrait opposite: #traitOwner'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTWithTraits classSide >> annotation [

	<MSEClass: #TWithTraits super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithTraits >> addTrait: anObject [
	traits add: anObject

]

{ #category : #accessing }
FamixTWithTraits >> traits [
	"Relation named: #traits type: #FamixTTrait opposite: #traitOwner"

	<generated>
	^ traits
]

{ #category : #accessing }
FamixTWithTraits >> traits: anObject [

	<generated>
	traits value: anObject

]
