"
FAMIXTrait models a trait as it can be found in Pharo or PHP.
"
Trait {
	#name : #FamixTTrait,
	#instVars : [
		'#incomingTraitUsages => FMMany type: #FamixTTraitUsage opposite: #trait',
		'#traitOwner => FMOne type: #FamixTWithTraits opposite: #traits'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTTrait classSide >> annotation [

	<MSEClass: #TTrait super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTrait >> addIncomingTraitUsage: anObject [

	incomingTraitUsages add: anObject

]

{ #category : #accessing }
FamixTTrait >> incomingTraitUsages [
	"Relation named: #incomingTraitUsages type: #FamixTTraitUsage opposite: #trait"

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
	"Relation named: #traitOwner type: #FamixTWithTraits opposite: #traits"

	<generated>
	^ traitOwner
]

{ #category : #accessing }
FamixTTrait >> traitOwner: anObject [

	<generated>
	traitOwner := anObject

]
