Class {
	#name : #FamixStAccess,
	#superclass : #MooseEntity,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAccess class >> annotation [

	<FMClass: #Access super: #MooseEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStAccess class >> metamodel [

	<generated>
	^ FamixStModel metamodel
]

{ #category : #testing }
FamixStAccess >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixStAccess >> isType [

	<generated>
	^ false
]

{ #category : #printing }
FamixStAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
