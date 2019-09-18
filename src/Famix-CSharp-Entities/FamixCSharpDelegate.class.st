Class {
	#name : #FamixCSharpDelegate,
	#superclass : #MooseEntity,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpDelegate class >> annotation [

	<MSEClass: #Delegate super: #MooseEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpDelegate class >> metamodel [

	<generated>
	^ (self class environment at: #FamixCSharpGenerator) metamodel
]

{ #category : #meta }
FamixCSharpDelegate class >> requirements [

	<generated>
	^ { FamixCSharpContainerEntity }
]

{ #category : #accessing }
FamixCSharpDelegate >> belongsTo [

	<generated>
	^ self typeContainer

]

{ #category : #accessing }
FamixCSharpDelegate >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #testing }
FamixCSharpDelegate >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpDelegate >> isStructuralEntity [

	<generated>
	^ false
]
