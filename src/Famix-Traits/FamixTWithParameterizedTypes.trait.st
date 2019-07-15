Trait {
	#name : #FamixTWithParameterizedTypes,
	#instVars : [
		'#parameterizedTypes => FMMany type: #FamixTParameterizedType opposite: #parameterizableClass'
	],
	#category : #'Famix-Traits-ParameterizedType'
}

{ #category : #meta }
FamixTWithParameterizedTypes classSide >> annotation [

	<MSEClass: #TWithParameterizedTypes super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithParameterizedTypes classSide >> generatedSlotNames [
	<generated>
	'FamixTWithParameterizedTypes class>>#generatedSlotNames'.
	^ #(parameterizedTypes)
]

{ #category : #generator }
FamixTWithParameterizedTypes classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithParameterizedTypes >> parameterizedTypes [

	<generated>
	^ parameterizedTypes
]

{ #category : #accessing }
FamixTWithParameterizedTypes >> parameterizedTypes: anObject [

	<generated>
	parameterizedTypes value: anObject

]
