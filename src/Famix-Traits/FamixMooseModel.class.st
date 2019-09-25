Class {
	#name : #FamixMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Traits'
}

{ #category : #meta }
FamixMooseModel class >> annotation [
	<MSEClass: #FamixMooseModel super: #MooseModel>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : #initialization }
FamixMooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixGenerator) metamodel
]
