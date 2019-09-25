Class {
	#name : #FamixTest1Model,
	#superclass : #MooseModel,
	#category : #'Famix-Test1-Entities'
}

{ #category : #meta }
FamixTest1Model class >> annotation [
	<MSEClass: #FamixTest1Model super: #MooseModel>
	<package: #'Famix-Test1-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTest1Model >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTest1Generator) metamodel
]
