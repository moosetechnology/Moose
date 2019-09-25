Class {
	#name : #FamixTest2Model,
	#superclass : #MooseModel,
	#category : #'Famix-Test2-Entities'
}

{ #category : #meta }
FamixTest2Model class >> annotation [
	<MSEClass: #FamixTest2Model super: #MooseModel>
	<package: #'Famix-Test2-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest2Model >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest2Generator) metamodel
]
