Class {
	#name : #FamixTest2Class,
	#superclass : #FamixTest2NamedEntity,
	#traits : 'FamixTClass + FamixTWithSubInheritances + FamixTWithSuperInheritances',
	#classTraits : 'FamixTClass classTrait + FamixTWithSubInheritances classTrait + FamixTWithSuperInheritances classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Class class >> annotation [

	<MSEClass: #Class super: #FamixTest2NamedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest2Class class >> requirements [

	<generated>
	^ {  }
]
