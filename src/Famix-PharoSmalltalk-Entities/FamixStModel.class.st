Class {
	#name : #FamixStModel,
	#superclass : #MooseModel,
	#category : #'Famix-PharoSmalltalk-Entities'
}

{ #category : #meta }
FamixStModel class >> annotation [
	<MSEClass: #FamixStModel super: #MooseModel>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : #initialization }
FamixStModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]
