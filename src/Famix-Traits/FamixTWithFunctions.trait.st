Trait {
	#name : #FamixTWithFunctions,
	#instVars : [
		'#functions => FMMany type: #FamixTFunction opposite: #functionOwner'
	],
	#category : #'Famix-Traits-Function'
}

{ #category : #meta }
FamixTWithFunctions classSide >> annotation [

	<FMClass: #TWithFunctions super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithFunctions >> addFunction: anObject [
	functions add: anObject

]

{ #category : #accessing }
FamixTWithFunctions >> functions [
	"Relation named: #functions type: #FamixTFunction opposite: #functionOwner"

	<generated>
	<FMComment: 'Functions defined in the container, if any.'>
	<derived>
	^ functions
]

{ #category : #accessing }
FamixTWithFunctions >> functions: anObject [

	<generated>
	functions value: anObject
]
