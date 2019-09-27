Class {
	#name : #FamixCSharpComment,
	#superclass : #FamixCSharpSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpComment class >> annotation [

	<MSEClass: #Comment super: #FamixCSharpSourcedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
