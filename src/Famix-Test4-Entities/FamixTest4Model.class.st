Class {
	#name : #FamixTest4Model,
	#superclass : #MooseModel,
	#category : #'Famix-Test4-Entities'
}

{ #category : #meta }
FamixTest4Model class >> annotation [
	<MSEClass: #FamixTest4Model super: #MooseModel>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest4Model >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest4Generator) metamodel
]
