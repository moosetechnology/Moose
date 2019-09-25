Class {
	#name : #FamixTestComposedMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedMetamodel-Entities'
}

{ #category : #meta }
FamixTestComposedMooseModel class >> annotation [
	<MSEClass: #FamixTestComposedMooseModel super: #MooseModel>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposedMooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedGenerator) metamodel
]
