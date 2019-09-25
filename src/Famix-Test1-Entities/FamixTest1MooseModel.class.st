Class {
	#name : #FamixTest1MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test1-Entities'
}

{ #category : #meta }
FamixTest1MooseModel class >> annotation [
	<MSEClass: #FamixTest1MooseModel super: #MooseModel>
	<package: #'Famix-Test1-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest1MooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest1Generator) metamodel
]
