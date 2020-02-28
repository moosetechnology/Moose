Class {
	#name : #FamixTest3Reference,
	#superclass : #MooseEntity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Reference class >> annotation [

	<FMClass: #Reference super: #MooseEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest3Reference class >> metamodel [

	<generated>
	^ FamixTest3Model metamodel
]

{ #category : #testing }
FamixTest3Reference >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Reference >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Reference >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Reference >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Reference >> isType [

	<generated>
	^ false
]
