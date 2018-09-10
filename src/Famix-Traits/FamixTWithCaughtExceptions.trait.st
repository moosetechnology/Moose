Trait {
	#name : #FamixTWithCaughtExceptions,
	#instVars : [
		'#caughtExceptions => FMMany type: #FamixTCaughtException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-CaughtException'
}

{ #category : #meta }
FamixTWithCaughtExceptions classSide >> annotation [

	<MSEClass: #TWithCaughtExceptions super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithCaughtExceptions classSide >> generatedSlotNames [
	<generated>
	'FamixTWithCaughtExceptions class>>#generatedSlotNames'.
	^ #(caughtExceptions)
]

{ #category : #generator }
FamixTWithCaughtExceptions classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithCaughtExceptions >> caughtExceptions [

	<generated>
	<MSEComment: 'The exceptions caught by the method'>
	^ caughtExceptions
]

{ #category : #accessing }
FamixTWithCaughtExceptions >> caughtExceptions: anObject [

	<generated>
	caughtExceptions value: anObject

]
