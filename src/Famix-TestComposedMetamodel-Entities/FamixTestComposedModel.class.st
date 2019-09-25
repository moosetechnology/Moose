Class {
	#name : #FamixTestComposedModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedMetamodel-Entities'
}

{ #category : #meta }
FamixTestComposedModel class >> annotation [
	<MSEClass: #FamixTestComposedModel super: #MooseModel>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposedModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedGenerator) metamodel
]
