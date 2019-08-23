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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithParameterizedTypes >> addParameterizedType: anObject [
	parameterizedTypes add: anObject

]

{ #category : #accessing }
FamixTWithParameterizedTypes >> parameterizedTypes [
	"Relation named: #parameterizedTypes type: #FamixTParameterizedType opposite: #parameterizableClass"

	<generated>
	^ parameterizedTypes
]

{ #category : #accessing }
FamixTWithParameterizedTypes >> parameterizedTypes: anObject [

	<generated>
	parameterizedTypes value: anObject

]
