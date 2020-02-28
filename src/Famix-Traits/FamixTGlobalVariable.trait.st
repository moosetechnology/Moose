"
FAMIXGlobalVariable represents a global variable in the source code.

"
Trait {
	#name : #FamixTGlobalVariable,
	#instVars : [
		'#parentScope => FMOne type: #FamixTWithGlobalVariables opposite: #globalVariables'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-GlobalVariable'
}

{ #category : #meta }
FamixTGlobalVariable classSide >> annotation [

	<FMClass: #TGlobalVariable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTGlobalVariable classSide >> famixTGlobalVariableRelatedGroup [

	<mooseGroup>
	
	^ FAMIXGlobalVariableGroup
]

{ #category : #accessing }
FamixTGlobalVariable >> parentScope [
	"Relation named: #parentScope type: #FamixTWithGlobalVariables opposite: #globalVariables"

	<generated>
	<FMComment: 'Scope declaring the global variable. belongsTo implementation'>
	<container>
	^ parentScope
]

{ #category : #accessing }
FamixTGlobalVariable >> parentScope: anObject [

	<generated>
	parentScope := anObject
]

{ #category : #navigation }
FamixTGlobalVariable >> parentScopeGroup [
	<generated>
	<navigation: 'ParentScope'>
	^ MooseGroup with: self parentScope
]
