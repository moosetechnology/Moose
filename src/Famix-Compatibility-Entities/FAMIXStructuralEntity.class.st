Class {
	#name : #FAMIXStructuralEntity,
	#superclass : #FAMIXLeafEntity,
	#traits : 'FamixTStructuralEntity + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTStructuralEntity classTrait + FamixTWithDereferencedInvocations classTrait',
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
