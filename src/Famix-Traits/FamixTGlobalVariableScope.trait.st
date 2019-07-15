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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTGlobalVariableScope classSide >> generatedSlotNames [
	<generated>
	'FamixTGlobalVariableScope class>>#generatedSlotNames'.
	^ #(globalVariables)
]

{ #category : #generator }
FamixTGlobalVariableScope classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTGlobalVariableScope >> addGlobalVariable: aGlobalVariable [ 
	globalVariables add: aGlobalVariable
]

{ #category : #accessing }
FamixTGlobalVariableScope >> globalVariables [

	<generated>
	<MSEComment: 'Global variables defined in the scope, if any.'>
	^ globalVariables
]

{ #category : #accessing }
FamixTGlobalVariableScope >> globalVariables: anObject [

	<generated>
	globalVariables value: anObject

]
