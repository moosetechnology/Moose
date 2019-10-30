"
FAMIXLocalVariable represents a local variable in the scope of a behavioural entity.
"
Trait {
	#name : #FamixTLocalVariable,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithLocalVariables opposite: #localVariables'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-LocalVariable'
}

{ #category : #meta }
FamixTLocalVariable classSide >> annotation [

	<FMClass: #TLocalVariable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTLocalVariable >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixTWithLocalVariables opposite: #localVariables"

	<generated>
	<FMComment: 'Behavioural entity declaring this local variable. belongsTo implementation'>
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
	^ MooseGroup with: self parentBehaviouralEntity
]
