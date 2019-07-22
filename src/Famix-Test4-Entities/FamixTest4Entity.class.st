Class {
	#name : #FamixTest4Entity,
	#superclass : #MooseEntity,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest4Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest4Generator) metamodel
]

{ #category : #accessing }
FamixTest4Entity >> name [

	<MSEProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
FamixTest4Entity >> name: anObject [

	<generated>
	name := anObject

]
