Class {
	#name : #FamixTest3Invocation,
	#superclass : #MooseEntity,
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Invocation class >> annotation [

	<FMClass: #Invocation super: #MooseEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest3Invocation class >> metamodel [

	<generated>
	^ FamixTest3Model metamodel
]

{ #category : #testing }
FamixTest3Invocation >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Invocation >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Invocation >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Invocation >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Invocation >> isType [

	<generated>
	^ false
]
