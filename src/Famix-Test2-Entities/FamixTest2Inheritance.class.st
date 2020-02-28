Class {
	#name : #FamixTest2Inheritance,
	#superclass : #MooseEntity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Inheritance class >> annotation [

	<FMClass: #Inheritance super: #MooseEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest2Inheritance class >> metamodel [

	<generated>
	^ FamixTest2Model metamodel
]

{ #category : #testing }
FamixTest2Inheritance >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Inheritance >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Inheritance >> isType [

	<generated>
	^ false
]
