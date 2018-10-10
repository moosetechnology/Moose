"
FAMIXTrait models a trait as it can be found in Pharo or PHP.
"
Trait {
	#name : #FamixTTrait,
	#instVars : [
		'#incomingTraitUsages => FMMany type: #FamixTTraitUsage opposite: #trait',
		'#traitOwner => FMOne type: #FamixTWithTrait opposite: #traits'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTTrait classSide >> annotation [

	<MSEClass: #TTrait super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTrait classSide >> generatedSlotNames [
	<generated>
	'FamixTTrait class>>#generatedSlotNames'.
	^ #(incomingTraitUsages traitOwner)
]

{ #category : #generator }
FamixTTrait classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTrait >> incomingTraitUsages [

	<generated>
	^ incomingTraitUsages
]

{ #category : #accessing }
FamixTTrait >> incomingTraitUsages: anObject [

	<generated>
	incomingTraitUsages value: anObject

]

{ #category : #accessing }
FamixTTrait >> traitOwner [

	<generated>
	^ traitOwner
]

{ #category : #accessing }
FamixTTrait >> traitOwner: anObject [

	<generated>
	traitOwner := anObject

]
