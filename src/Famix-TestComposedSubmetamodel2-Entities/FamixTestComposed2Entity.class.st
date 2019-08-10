Class {
	#name : #FamixTestComposed2Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed2Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedSubmetamodel2Generator) metamodel
]

{ #category : #testing }
FamixTestComposed2Entity >> isAssociation [

	<generated>
	^ false
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
