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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithLocalVariables >> addLocalVariable: aLocalVariable [
	localVariables add: aLocalVariable
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables [
	"Relation named: #localVariables type: #FamixTLocalVariable opposite: #parentBehaviouralEntity"

	<generated>
	<MSEComment: 'Variables locally defined by this behaviour.'>
	^ localVariables
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables: anObject [

	<generated>
	localVariables value: anObject

]
