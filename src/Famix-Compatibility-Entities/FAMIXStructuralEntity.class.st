Class {
	#name : #FAMIXStructuralEntity,
	#superclass : #FAMIXLeafEntity,
	#traits : 'FamixTAccessible + FamixTTypedStructure + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTAccessible classTrait + FamixTTypedStructure classTrait + FamixTWithDereferencedInvocations classTrait',
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> namespaceScope [
	^ self subclassResponsibility
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> packageScope [
	^ (self atScope: FamixTType) ifEmpty: [ nil ] ifNotEmpty: [ :types | types anyOne packageScope ]
]
