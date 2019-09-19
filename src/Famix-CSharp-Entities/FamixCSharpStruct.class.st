Class {
	#name : #FamixCSharpStruct,
	#superclass : #FamixCSharpType,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpStruct class >> annotation [

	<MSEClass: #Struct super: #MooseEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpStruct class >> metamodel [

	<generated>
	^ (self class environment at: #FamixCSharpGenerator) metamodel
]

{ #category : #meta }
FamixCSharpStruct class >> requirements [

	<generated>
	^ { FamixCSharpContainerEntity }
]

{ #category : #accessing }
FamixCSharpStruct >> belongsTo [

	<generated>
	^ self typeContainer

]

{ #category : #accessing }
FamixCSharpStruct >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #testing }
FamixCSharpStruct >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpStruct >> isStructuralEntity [

	<generated>
	^ false
]
