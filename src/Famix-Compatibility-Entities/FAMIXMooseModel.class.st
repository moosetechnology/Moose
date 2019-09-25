Class {
	#name : #FAMIXMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Compatibility-Entities'
}

{ #category : #meta }
FAMIXMooseModel class >> annotation [
	<MSEClass: #FAMIXMooseModel super: #MooseModel>
	<package: #FAMIX>
	<generated>
]

{ #category : #initialization }
FAMIXMooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixCompatibilityGenerator) metamodel
]
