Class {
	#name : #FamixTest2Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest2Entity class >> metamodel [

	<generated>
	^ FamixTest2Model metamodel
]

{ #category : #testing }
FamixTest2Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isType [

	<generated>
	^ false
]
