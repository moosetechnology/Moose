Class {
	#name : #FamixCSharpSourcedEntity,
	#superclass : #FamixCSharpEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments + FamixTWithFiles',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait + FamixTWithFiles classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixCSharpEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
