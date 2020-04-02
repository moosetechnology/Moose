Class {
	#name : #FamixTagTestPackage,
	#superclass : #FamixTagTestEntity,
	#traits : 'FamixTNamedEntity + FamixTPackage + FamixTWithTypes',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTPackage classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Tagging-Tests-Entities-Entities'
}

{ #category : #meta }
FamixTagTestPackage class >> annotation [

	<FMClass: #Package super: #FamixTagTestEntity>
	<package: #'Famix-Tagging-Tests-Entities'>
	<generated>
	^self
]
