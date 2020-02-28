Class {
	#name : #FamixJavaReference,
	#superclass : #MooseEntity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaReference class >> annotation [

	<FMClass: #Reference super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaReference class >> metamodel [

	<generated>
	^ FamixJavaModel metamodel
]

{ #category : #testing }
FamixJavaReference >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaReference >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self from ifNotNil: [ aStream nextPutAll: self from name ].
	aStream nextPutAll: ' refers to '.
	self to ifNotNil: [ aStream nextPutAll: self to name ]
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
