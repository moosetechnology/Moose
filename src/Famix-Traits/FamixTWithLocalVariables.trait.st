Trait {
	#name : #FamixTWithLocalVariables,
	#instVars : [
		'#localVariables => FMMany type: #FamixTLocalVariable opposite: #parentBehaviouralEntity'
	],
	#category : #'Famix-Traits-LocalVariable'
}

{ #category : #meta }
FamixTWithLocalVariables classSide >> annotation [

	<MSEClass: #TWithLocalVariables super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithLocalVariables classSide >> generatedSlotNames [
	<generated>
	'FamixTWithLocalVariables class>>#generatedSlotNames'.
	^ #(localVariables)
]

{ #category : #generator }
FamixTWithLocalVariables classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithLocalVariables >> addLocalVariable: aLocalVariable [
	localVariables add: aLocalVariable
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables [

	<generated>
	<MSEComment: 'Variables locally defined by this behaviour.'>
	^ localVariables
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables: anObject [

	<generated>
	localVariables value: anObject

]
