Trait {
	#name : #FamixTWithParameterizedTypeUsers,
	#instVars : [
		'#arguments => FMMany type: #FamixTParameterizedTypeUser opposite: #argumentsInParameterizedTypes'
	],
	#category : #'Famix-Traits-ParameterizedTypeUser'
}

{ #category : #meta }
FamixTWithParameterizedTypeUsers classSide >> annotation [

	<MSEClass: #TWithParameterizedTypeUsers super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithParameterizedTypeUsers classSide >> generatedSlotNames [
	<generated>
	'FamixTWithParameterizedTypeUsers class>>#generatedSlotNames'.
	^ #(arguments)
]

{ #category : #generator }
FamixTWithParameterizedTypeUsers classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithParameterizedTypeUsers >> arguments [

	<generated>
	^ arguments
]

{ #category : #accessing }
FamixTWithParameterizedTypeUsers >> arguments: anObject [

	arguments value: anObject.
	self resetMooseName.

]
