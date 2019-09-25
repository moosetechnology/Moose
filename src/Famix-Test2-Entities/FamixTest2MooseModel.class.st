Class {
	#name : #FamixTest2MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test2-Entities'
}

{ #category : #meta }
FamixTest2MooseModel class >> annotation [
	<MSEClass: #FamixTest2MooseModel super: #MooseModel>
	<package: #'Famix-Test2-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest2MooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest2Generator) metamodel
]
