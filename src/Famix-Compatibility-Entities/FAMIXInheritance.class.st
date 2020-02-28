Class {
	#name : #FAMIXInheritance,
	#superclass : #MooseEntity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXInheritance class >> annotation [

	<FMClass: #Inheritance super: #MooseEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXInheritance class >> metamodel [

	<generated>
	^ FAMIXModel metamodel
]

{ #category : #'Moose-Hismo' }
FAMIXInheritance >> historicalUniqueName [
	
	^(self subclass mooseName , '->' , self superclass mooseName) asSymbol
]

{ #category : #testing }
FAMIXInheritance >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInheritance >> isType [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FAMIXInheritance >> mooseNameOn: aStream [
	self subclass ifNotNil: [ aStream nextPutAll: self subclass name ].
	aStream nextPutAll: ' -> '.
	self superclass ifNotNil: [ aStream nextPutAll: self superclass name ]
]

{ #category : #'Famix-Implementation' }
FAMIXInheritance >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Inheritance)'
]
