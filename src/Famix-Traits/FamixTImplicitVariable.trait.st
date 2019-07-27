"
FAMIXImplicitVariable represents a variable defined by the compiler in a context, such as self, super, thisContext.
"
Trait {
	#name : #FamixTImplicitVariable,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithImplicitVariables opposite: #implicitVariables'
	],
	#category : #'Famix-Traits-ImplicitVariable'
}

{ #category : #meta }
FamixTImplicitVariable classSide >> annotation [

	<MSEClass: #TImplicitVariable super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTImplicitVariable >> parentBehaviouralEntity [

	<generated>
	<MSEComment: 'The behaviour containing this implicit variable. belongsTo implementation'>
	<container>

	^ parentBehaviouralEntity
]

{ #category : #accessing }
FamixTImplicitVariable >> parentBehaviouralEntity: anObject [

	parentBehaviouralEntity := anObject.
	self resetMooseName.
	

]

{ #category : #navigation }
FamixTImplicitVariable >> parentBehaviouralEntityGroup [

	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseGroup
			with: (self parentBehaviouralEntity)
]
