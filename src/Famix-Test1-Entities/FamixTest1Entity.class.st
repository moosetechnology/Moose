Class {
	#name : #FamixTest1Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest1Entity class >> metamodel [

	<generated>
	^ FamixTest1Model metamodel
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
FamixTest1Entity >> isMethod [

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
