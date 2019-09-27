Class {
	#name : #FamixTestComposed3Model,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposed3Metamodel-Entities'
}

{ #category : #meta }
FamixTestComposed3Model class >> annotation [
	<MSEClass: #FamixTestComposed3Model super: #MooseModel>
	<package: #'Famix-TestComposed3Metamodel-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposed3Model >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposed3Generator) metamodel
]
