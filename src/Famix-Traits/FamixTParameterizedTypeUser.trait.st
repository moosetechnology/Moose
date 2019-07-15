Trait {
	#name : #FamixTParameterizedTypeUser,
	#instVars : [
		'#argumentsInParameterizedTypes => FMMany type: #FamixTWithParameterizedTypeUsers opposite: #arguments'
	],
	#category : #'Famix-Traits-ParameterizedTypeUser'
}

{ #category : #meta }
FamixTParameterizedTypeUser classSide >> annotation [

	<MSEClass: #TParameterizedTypeUser super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTParameterizedTypeUser classSide >> generatedSlotNames [
	<generated>
	'FamixTParameterizedTypeUser class>>#generatedSlotNames'.
	^ #(argumentsInParameterizedTypes)
]

{ #category : #generator }
FamixTParameterizedTypeUser classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTParameterizedTypeUser >> argumentsInParameterizedTypes [

	<generated>
	^ argumentsInParameterizedTypes
]

{ #category : #accessing }
FamixTParameterizedTypeUser >> argumentsInParameterizedTypes: anObject [

	<generated>
	argumentsInParameterizedTypes value: anObject

]
