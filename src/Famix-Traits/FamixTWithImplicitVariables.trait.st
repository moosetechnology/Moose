Trait {
	#name : #FamixTWithImplicitVariables,
	#instVars : [
		'#implicitVariables => FMMany type: #FamixTImplicitVariable opposite: #parentBehaviouralEntity'
	],
	#category : #'Famix-Traits-ImplicitVariable'
}

{ #category : #meta }
FamixTWithImplicitVariables classSide >> annotation [

	<MSEClass: #TWithImplicitVariables super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTWithImplicitVariables >> addImplicitVariable: anImplicitVariable [
	implicitVariables add: anImplicitVariable
]

{ #category : #accessing }
FamixTWithImplicitVariables >> implicitVariables [
	"Relation named: #implicitVariables type: #FamixTImplicitVariable opposite: #parentBehaviouralEntity"

	<generated>
	<MSEComment: 'Implicit variables used locally by this behaviour.'>
	^ implicitVariables
]

{ #category : #accessing }
FamixTWithImplicitVariables >> implicitVariables: anObject [

	<generated>
	implicitVariables value: anObject

]
