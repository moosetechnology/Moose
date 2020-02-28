Class {
	#name : #FamixJavaInheritance,
	#superclass : #MooseEntity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInheritance class >> annotation [

	<FMClass: #Inheritance super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaInheritance class >> metamodel [

	<generated>
	^ FamixJavaModel metamodel
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> historicalUniqueName [
	
	^(self subclass mooseName , '->' , self superclass mooseName) asSymbol
]

{ #category : #testing }
FamixJavaInheritance >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaInheritance >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> mooseNameOn: aStream [
	self subclass ifNotNil: [ aStream nextPutAll: self subclass name ].
	aStream nextPutAll: ' -> '.
	self superclass ifNotNil: [ aStream nextPutAll: self superclass name ]
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Inheritance)'
]
