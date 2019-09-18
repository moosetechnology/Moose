Class {
	#name : #FamixCSharpType,
	#superclass : #FamixCSharpContainerEntity,
	#traits : 'FamixTClassHierarchyNavigation + FamixTParameterizedTypeUser + FamixTType + FamixTWithTypeAliases',
	#classTraits : 'FamixTClassHierarchyNavigation classTrait + FamixTParameterizedTypeUser classTrait + FamixTType classTrait + FamixTWithTypeAliases classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpType class >> annotation [

	<MSEClass: #Type super: #FamixCSharpContainerEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpType class >> requirements [

	<generated>
	^ { FamixCSharpContainerEntity }
]

{ #category : #accessing }
FamixCSharpType >> belongsTo [

	<generated>
	^ self typeContainer

]

{ #category : #accessing }
FamixCSharpType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]
