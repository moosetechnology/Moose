"
FAMIXParameter represents one parameter in a method declaration.
"
Trait {
	#name : #FamixTParameter,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithParameters opposite: #parameters'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-Parameter'
}

{ #category : #meta }
FamixTParameter classSide >> annotation [

	<FMClass: #TParameter super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTParameter >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixTWithParameters opposite: #parameters"

	<generated>
	<FMComment: 'Behavioural entity containing this parameter. belongsTo implementation'>
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
	^ MooseGroup with: self parentBehaviouralEntity
]
