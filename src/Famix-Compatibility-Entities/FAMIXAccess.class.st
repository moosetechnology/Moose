Class {
	#name : #FAMIXAccess,
	#superclass : #MooseEntity,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAccess class >> annotation [

	<FMClass: #Access super: #MooseEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAccess class >> fromMethod [
	^ self lookupSelector: #accessor
]

{ #category : #meta }
FAMIXAccess class >> metamodel [

	<generated>
	^ FAMIXModel metamodel
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAccess class >> toMethod [
	^ self lookupSelector: #variable
]

{ #category : #testing }
FAMIXAccess >> isAccess [
	^true
]

{ #category : #testing }
FAMIXAccess >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXAccess >> isType [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FAMIXAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
