Class {
	#name : #FamixJavaAccess,
	#superclass : #MooseEntity,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAccess class >> annotation [

	<FMClass: #Access super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaAccess class >> metamodel [

	<generated>
	^ FamixJavaModel metamodel
]

{ #category : #testing }
FamixJavaAccess >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAccess >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
