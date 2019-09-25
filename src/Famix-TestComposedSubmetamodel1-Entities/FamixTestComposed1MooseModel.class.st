Class {
	#name : #FamixTestComposed1MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedSubmetamodel1-Entities'
}

{ #category : #meta }
FamixTestComposed1MooseModel class >> annotation [
	<MSEClass: #FamixTestComposed1MooseModel super: #MooseModel>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposed1MooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedSubmetamodel1Generator) metamodel
]
