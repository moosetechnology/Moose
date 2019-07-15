"
FAMIXParameter represents one parameter in a method declaration.
"
Trait {
	#name : #FamixTParameter,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithParameters opposite: #parameters'
	],
	#category : #'Famix-Traits-Parameter'
}

{ #category : #meta }
FamixTParameter classSide >> annotation [

	<MSEClass: #TParameter super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTParameter classSide >> generatedSlotNames [
	<generated>
	'FamixTParameter class>>#generatedSlotNames'.
	^ #(parentBehaviouralEntity)
]

{ #category : #generator }
FamixTParameter classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTParameter >> parentBehaviouralEntity [

	<generated>
	<MSEComment: 'Behavioural entity containing this parameter. belongsTo implementation'>
	<container>

	^ parentBehaviouralEntity
]

{ #category : #accessing }
FamixTParameter >> parentBehaviouralEntity: anObject [

	parentBehaviouralEntity := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTParameter >> parentBehaviouralEntityGroup [

	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseGroup
			with: (self parentBehaviouralEntity)
]
