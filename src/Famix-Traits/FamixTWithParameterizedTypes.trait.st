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

{ #category : #accessing }
FamixTWithParameterizedTypes >> addParameterizedType: anObject [
	parameterizedTypes add: anObject

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
