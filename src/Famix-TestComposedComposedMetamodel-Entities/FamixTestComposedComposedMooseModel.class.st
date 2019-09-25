Class {
	#name : #FamixTestComposedComposedMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedComposedMetamodel-Entities'
}

{ #category : #meta }
FamixTestComposedComposedMooseModel class >> annotation [
	<MSEClass: #FamixTestComposedComposedMooseModel super: #MooseModel>
	<package: #'Famix-TestComposedComposedMetamodel-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposedComposedMooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedComposedGenerator) metamodel
]
