Class {
	#name : #FamixTestComposed2MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedSubmetamodel2-Entities'
}

{ #category : #meta }
FamixTestComposed2MooseModel class >> annotation [
	<MSEClass: #FamixTestComposed2MooseModel super: #MooseModel>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposed2MooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedSubmetamodel2Generator) metamodel
]
