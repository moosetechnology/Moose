Class {
	#name : #FAMIXModel,
	#superclass : #MooseModel,
	#category : #'Famix-Compatibility-Entities'
}

{ #category : #meta }
FAMIXModel class >> annotation [
	<MSEClass: #FAMIXModel super: #MooseModel>
	<package: #FAMIX>
	<generated>
]

{ #category : #initialization }
FAMIXModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixCompatibilityGenerator) metamodel
]
