Class {
	#name : #FamixTestComposedComposedModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedComposedMetamodel-Entities'
}

{ #category : #meta }
FamixTestComposedComposedModel class >> annotation [
	<MSEClass: #FamixTestComposedComposedModel super: #MooseModel>
	<package: #'Famix-TestComposedComposedMetamodel-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposedComposedModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedComposedGenerator) metamodel
]
