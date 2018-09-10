Trait {
	#name : #FamixTSuper,
	#instVars : [
		'#subs => FMMany type: #FamixTSub opposite: #supers'
	],
	#category : #'Famix-Traits-Inheritance-Simple'
}

{ #category : #meta }
FamixTSuper classSide >> annotation [

	<MSEClass: #TSuper super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTSuper classSide >> generatedSlotNames [
	<generated>
	'FamixTSuper class>>#generatedSlotNames'.
	^ #(subs)
]

{ #category : #generator }
FamixTSuper classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTSuper >> subs [

	<generated>
	^ subs
]

{ #category : #accessing }
FamixTSuper >> subs: anObject [

	<generated>
	subs value: anObject

]
