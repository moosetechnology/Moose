Trait {
	#name : #FamixTTraitUser,
	#instVars : [
		'#outgoingTraitUsages => FMMany type: #FamixTTraitUsage opposite: #user'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTTraitUser classSide >> annotation [

	<MSEClass: #TTraitUser super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTraitUser classSide >> generatedSlotNames [
	<generated>
	'FamixTTraitUser class>>#generatedSlotNames'.
	^ #(outgoingTraitUsages)
]

{ #category : #generator }
FamixTTraitUser classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTraitUser >> outgoingTraitUsages [

	<generated>
	^ outgoingTraitUsages
]

{ #category : #accessing }
FamixTTraitUser >> outgoingTraitUsages: anObject [

	<generated>
	outgoingTraitUsages value: anObject

]
