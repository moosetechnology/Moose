Trait {
	#name : #FamixTGlobalVariableScope,
	#instVars : [
		'#globalVariables => FMMany type: #FamixTGlobalVariable opposite: #parentScope'
	],
	#category : #'Famix-Traits-GlobalVariable'
}

{ #category : #meta }
FamixTGlobalVariableScope classSide >> annotation [

	<MSEClass: #TGlobalVariableScope super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTGlobalVariableScope >> addGlobalVariable: aGlobalVariable [ 
	globalVariables add: aGlobalVariable
]

{ #category : #accessing }
FamixTGlobalVariableScope >> globalVariables [
	"Relation named: #globalVariables type: #FamixTGlobalVariable opposite: #parentScope"

	<generated>
	<MSEComment: 'Global variables defined in the scope, if any.'>
	^ globalVariables
]

{ #category : #accessing }
FamixTGlobalVariableScope >> globalVariables: anObject [

	<generated>
	globalVariables value: anObject

]
