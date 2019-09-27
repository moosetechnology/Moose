Class {
	#name : #FamixModel,
	#superclass : #MooseModel,
	#category : #'Famix-Traits'
}

{ #category : #meta }
FamixModel class >> annotation [
	<MSEClass: #FamixModel super: #MooseModel>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : #initialization }
FamixModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixGenerator) metamodel
]
