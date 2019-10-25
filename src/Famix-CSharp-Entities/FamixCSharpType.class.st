Class {
	#name : #FamixCSharpType,
	#superclass : #FamixCSharpContainerEntity,
	#traits : 'FamixCSharpTWithProperties + FamixTClassHierarchyNavigation + FamixTContainingWithStatementsGlue + FamixTParameterizedTypeUser + FamixTType + FamixTWithAttributes + FamixTWithMethods + FamixTWithMethodsWithModifiersGlue + FamixTWithSubInheritances + FamixTWithSuperInheritances + FamixTWithTypeAliases',
	#classTraits : 'FamixCSharpTWithProperties classTrait + FamixTClassHierarchyNavigation classTrait + FamixTContainingWithStatementsGlue classTrait + FamixTParameterizedTypeUser classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithMethods classTrait + FamixTWithMethodsWithModifiersGlue classTrait + FamixTWithSubInheritances classTrait + FamixTWithSuperInheritances classTrait + FamixTWithTypeAliases classTrait',
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
