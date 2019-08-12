Class {
	#name : #FAMIXStructuralEntity,
	#superclass : #FAMIXLeafEntity,
	#traits : 'FamixTAccessible + FamixTStructuralEntity + FamixTTypedStructure + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTAccessible classTrait + FamixTStructuralEntity classTrait + FamixTTypedStructure classTrait + FamixTWithDereferencedInvocations classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXStructuralEntity class >> annotation [

	<MSEClass: #StructuralEntity super: #FAMIXLeafEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Extensions' }
FAMIXStructuralEntity >> isSharedVariable [

	^ false
]
