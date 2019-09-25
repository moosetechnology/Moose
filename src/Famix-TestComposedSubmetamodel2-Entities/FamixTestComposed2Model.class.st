Class {
	#name : #FamixTestComposed2Model,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedSubmetamodel2-Entities'
}

{ #category : #meta }
FamixTestComposed2Model class >> annotation [
	<MSEClass: #FamixTestComposed2Model super: #MooseModel>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposed2Model >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedSubmetamodel2Generator) metamodel
]
