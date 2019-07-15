"
FAMIXLocalVariable represents a local variable in the scope of a behavioural entity.
"
Trait {
	#name : #FamixTLocalVariable,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithLocalVariables opposite: #localVariables'
	],
	#category : #'Famix-Traits-LocalVariable'
}

{ #category : #meta }
FamixTLocalVariable classSide >> annotation [

	<MSEClass: #TLocalVariable super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTLocalVariable classSide >> generatedSlotNames [
	<generated>
	'FamixTLocalVariable class>>#generatedSlotNames'.
	^ #(parentBehaviouralEntity)
]

{ #category : #generator }
FamixTLocalVariable classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTLocalVariable >> parentBehaviouralEntity [

	<generated>
	<MSEComment: 'Behavioural entity declaring this local variable. belongsTo implementation'>
	<container>

	^ parentBehaviouralEntity
]

{ #category : #accessing }
FamixTLocalVariable >> parentBehaviouralEntity: anObject [

	parentBehaviouralEntity := anObject.
	self resetMooseName.
	

]

{ #category : #navigation }
FamixTLocalVariable >> parentBehaviouralEntityGroup [

	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseGroup
			with: (self parentBehaviouralEntity)
]
