Class {
	#name : #FamixTest3MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test3-Entities'
}

{ #category : #meta }
FamixTest3MooseModel class >> annotation [
	<MSEClass: #FamixTest3MooseModel super: #MooseModel>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest3MooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest3Generator) metamodel
]
