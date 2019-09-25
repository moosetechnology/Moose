Class {
	#name : #FamixTestComposed3MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposed3Metamodel-Entities'
}

{ #category : #meta }
FamixTestComposed3MooseModel class >> annotation [
	<MSEClass: #FamixTestComposed3MooseModel super: #MooseModel>
	<package: #'Famix-TestComposed3Metamodel-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposed3MooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposed3Generator) metamodel
]
