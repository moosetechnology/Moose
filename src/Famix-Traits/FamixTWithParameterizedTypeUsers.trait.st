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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithParameterizedTypeUsers >> addArgument: anObject [

	arguments add: anObject.
	self resetMooseName.

]

{ #category : #accessing }
FamixTWithParameterizedTypeUsers >> arguments [
	"Relation named: #arguments type: #FamixTParameterizedTypeUser opposite: #argumentsInParameterizedTypes"

	<generated>
	^ arguments
]

{ #category : #accessing }
FamixTWithParameterizedTypeUsers >> arguments: anObject [

	arguments value: anObject.
	self resetMooseName.

]
