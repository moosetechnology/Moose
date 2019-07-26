Class {
	#name : #FamixTest1Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest1Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest1Generator) metamodel
]

{ #category : #testing }
FamixTest1Entity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Entity >> isType [

	<generated>
	^ false
]
