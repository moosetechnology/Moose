Class {
	#name : #FamixTestComposed1Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed1Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedSubmetamodel1Generator) metamodel
]

{ #category : #testing }
FamixTestComposed1Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isType [

	<generated>
	^ false
]
