Class {
	#name : #FamixTestComposed2Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed2Entity class >> metamodel [

	<generated>
	^ FamixTestComposed2Model metamodel
]

{ #category : #testing }
FamixTestComposed2Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isType [

	<generated>
	^ false
]
