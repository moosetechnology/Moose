"
A container having Global variables
"
Trait {
	#name : #FamixTWithGlobalVariables,
	#instVars : [
		'#globalVariables => FMMany type: #FamixTGlobalVariable opposite: #parentScope'
	],
	#category : #'Famix-Traits-GlobalVariable'
}

{ #category : #meta }
FamixTWithGlobalVariables classSide >> annotation [

	<FMClass: #TWithGlobalVariables super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTWithGlobalVariables >> addGlobalVariable: anObject [
	<generated>
	^ self globalVariables add: anObject
]

{ #category : #accessing }
FamixTWithGlobalVariables >> globalVariables [
	"Relation named: #globalVariables type: #FamixTGlobalVariable opposite: #parentScope"

	<generated>
	<FMComment: 'Global variables defined in the scope, if any.'>
	<derived>
	^ globalVariables
]

{ #category : #accessing }
FamixTWithGlobalVariables >> globalVariables: anObject [

	<generated>
	globalVariables value: anObject
]
