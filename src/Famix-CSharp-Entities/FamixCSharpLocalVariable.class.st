Class {
	#name : #FamixCSharpLocalVariable,
	#superclass : #FamixCSharpNamedEntity,
	#traits : 'FamixCSharpTStructuralEntity + FamixTLocalVariable',
	#classTraits : 'FamixCSharpTStructuralEntity classTrait + FamixTLocalVariable classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #FamixCSharpNamedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixCSharpLocalVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixCSharpLocalVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]
