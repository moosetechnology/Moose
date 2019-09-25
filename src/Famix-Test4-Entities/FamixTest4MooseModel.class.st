Class {
	#name : #FamixTest4MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test4-Entities'
}

{ #category : #meta }
FamixTest4MooseModel class >> annotation [
	<MSEClass: #FamixTest4MooseModel super: #MooseModel>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest4MooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest4Generator) metamodel
]
