Class {
	#name : #FamixCSharpParameter,
	#superclass : #FamixCSharpNamedEntity,
	#traits : 'FamixCSharpTStructuralEntity + FamixTParameter',
	#classTraits : 'FamixCSharpTStructuralEntity classTrait + FamixTParameter classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpParameter class >> annotation [

	<MSEClass: #Parameter super: #FamixCSharpNamedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixCSharpParameter >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixCSharpParameter >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]
