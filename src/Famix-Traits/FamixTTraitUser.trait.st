Trait {
	#name : #FamixTTraitUser,
	#instVars : [
		'#outgoingTraitUsages => FMMany type: #FamixTTraitUsage opposite: #user'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTTraitUser classSide >> annotation [

	<FMClass: #TTraitUser super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTraitUser >> addOutgoingTraitUsage: anObject [

	outgoingTraitUsages add: anObject

]

{ #category : #accessing }
FamixTTraitUser >> outgoingTraitUsages [
	"Relation named: #outgoingTraitUsages type: #FamixTTraitUsage opposite: #user"

	<generated>
	<derived>
	^ outgoingTraitUsages
]

{ #category : #accessing }
FamixTTraitUser >> outgoingTraitUsages: anObject [

	<generated>
	outgoingTraitUsages value: anObject
]
