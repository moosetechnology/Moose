Trait {
	#name : #FamixTWithTrait,
	#instVars : [
		'#traits => FMMany type: #FamixTTrait opposite: #traitOwner'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTWithTrait classSide >> annotation [

	<MSEClass: #TWithTrait super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithTrait classSide >> generatedSlotNames [
	<generated>
	'FamixTWithTrait class>>#generatedSlotNames'.
	^ #(traits)
]

{ #category : #generator }
FamixTWithTrait classSide >> generatedTraitNames [
	<generated>
	^ #()
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
