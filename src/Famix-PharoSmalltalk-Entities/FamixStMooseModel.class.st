Class {
	#name : #FamixStMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-PharoSmalltalk-Entities'
}

{ #category : #meta }
FamixStMooseModel class >> annotation [
	<MSEClass: #FamixStMooseModel super: #MooseModel>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : #initialization }
FamixStMooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]
