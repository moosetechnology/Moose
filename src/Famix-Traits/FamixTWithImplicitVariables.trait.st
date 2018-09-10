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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithImplicitVariables classSide >> generatedSlotNames [
	<generated>
	'FamixTWithImplicitVariables class>>#generatedSlotNames'.
	^ #(implicitVariables)
]

{ #category : #generator }
FamixTWithImplicitVariables classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #adding }
FamixTWithImplicitVariables >> addImplicitVariable: anImplicitVariable [
	implicitVariables add: anImplicitVariable
]

{ #category : #accessing }
FamixTWithImplicitVariables >> implicitVariables [

	<generated>
	<MSEComment: 'Implicit variables used locally by this behaviour.'>
	^ implicitVariables
]

{ #category : #accessing }
FamixTWithImplicitVariables >> implicitVariables: anObject [

	<generated>
	implicitVariables value: anObject

]
