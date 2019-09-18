Class {
	#name : #FamixCSharpImplicitVariable,
	#superclass : #FamixCSharpNamedEntity,
	#traits : 'FamixCSharpTStructuralEntity + FamixTImplicitVariable',
	#classTraits : 'FamixCSharpTStructuralEntity classTrait + FamixTImplicitVariable classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpImplicitVariable class >> annotation [

	<MSEClass: #ImplicitVariable super: #FamixCSharpNamedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixCSharpImplicitVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixCSharpImplicitVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]
