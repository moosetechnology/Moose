Class {
	#name : #FamixTagTestMethod,
	#superclass : #FamixTagTestEntity,
	#traits : 'FamixTMethod + FamixTSourceEntity',
	#classTraits : 'FamixTMethod classTrait + FamixTSourceEntity classTrait',
	#category : #'Famix-Tagging-Tests-Entities-Entities'
}

{ #category : #meta }
FamixTagTestMethod class >> annotation [

	<FMClass: #Method super: #FamixTagTestEntity>
	<package: #'Famix-Tagging-Tests-Entities'>
	<generated>
	^self
]
