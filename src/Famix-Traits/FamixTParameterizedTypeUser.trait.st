Trait {
	#name : #FamixTParameterizedTypeUser,
	#instVars : [
		'#argumentsInParameterizedTypes => FMMany type: #FamixTWithParameterizedTypeUsers opposite: #arguments'
	],
	#category : #'Famix-Traits-ParameterizedTypeUser'
}

{ #category : #meta }
FamixTParameterizedTypeUser classSide >> annotation [

	<FMClass: #TParameterizedTypeUser super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTParameterizedTypeUser >> addArgumentsInParameterizedType: anObject [

	argumentsInParameterizedTypes add: anObject

]

{ #category : #accessing }
FamixTParameterizedTypeUser >> argumentsInParameterizedTypes [
	"Relation named: #argumentsInParameterizedTypes type: #FamixTWithParameterizedTypeUsers opposite: #arguments"

	<generated>
	<derived>
	^ argumentsInParameterizedTypes
]

{ #category : #accessing }
FamixTParameterizedTypeUser >> argumentsInParameterizedTypes: anObject [

	<generated>
	argumentsInParameterizedTypes value: anObject
]
