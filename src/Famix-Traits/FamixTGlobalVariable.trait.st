"
FAMIXGlobalVariable represents a global variable in the source code.

"
Trait {
	#name : #FamixTGlobalVariable,
	#instVars : [
		'#parentScope => FMOne type: #FamixTGlobalVariableScope opposite: #globalVariables'
	],
	#category : #'Famix-Traits-GlobalVariable'
}

{ #category : #meta }
FamixTGlobalVariable classSide >> annotation [

	<MSEClass: #TGlobalVariable super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTGlobalVariable classSide >> generatedSlotNames [
	<generated>
	'FamixTGlobalVariable class>>#generatedSlotNames'.
	^ #(parentScope)
]

{ #category : #generator }
FamixTGlobalVariable classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTGlobalVariable >> parentScope [

	<generated>
	<MSEComment: 'Scope declaring the global variable. belongsTo implementation'>
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
	^ MooseGroup
			with: (self parentScope)
]
