Class {
	#name : #FamixTest3Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest3Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest3Generator) metamodel
]

{ #category : #testing }
FamixTest3Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isType [

	<generated>
	^ false
]
