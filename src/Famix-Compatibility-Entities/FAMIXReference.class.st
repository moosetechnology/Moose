Class {
	#name : #FAMIXReference,
	#superclass : #MooseEntity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXReference class >> annotation [

	<FMClass: #Reference super: #MooseEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXReference class >> metamodel [

	<generated>
	^ FAMIXModel metamodel
]

{ #category : #testing }
FAMIXReference >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXReference >> isType [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self from ifNotNil: [ aStream nextPutAll: self from name ].
	aStream nextPutAll: ' refers to '.
	self to ifNotNil: [ aStream nextPutAll: self to name ]
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
