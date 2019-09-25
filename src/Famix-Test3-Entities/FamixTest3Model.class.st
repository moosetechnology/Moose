Class {
	#name : #FamixTest3Model,
	#superclass : #MooseModel,
	#category : #'Famix-Test3-Entities'
}

{ #category : #meta }
FamixTest3Model class >> annotation [
	<MSEClass: #FamixTest3Model super: #MooseModel>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest3Model >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest3Generator) metamodel
]
