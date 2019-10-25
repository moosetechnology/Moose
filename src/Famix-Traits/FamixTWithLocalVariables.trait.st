Trait {
	#name : #FamixTWithLocalVariables,
	#instVars : [
		'#localVariables => FMMany type: #FamixTLocalVariable opposite: #parentBehaviouralEntity'
	],
	#category : #'Famix-Traits-LocalVariable'
}

{ #category : #meta }
FamixTWithLocalVariables classSide >> annotation [

	<MSEClass: #TWithLocalVariables super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithLocalVariables >> addLocalVariable: aLocalVariable [
	localVariables add: aLocalVariable
]

{ #category : #adding }
FamixTWithLocalVariables >> addLocalVariables: anObject [
	<generated>
	^ self localVariables add: anObject
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables [
	"Relation named: #localVariables type: #FamixTLocalVariable opposite: #parentBehaviouralEntity"

	<generated>
	<MSEComment: 'Variables locally defined by this behaviour.'>
	<derived>
	^ localVariables
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables: anObject [

	<generated>
	localVariables value: anObject

]
