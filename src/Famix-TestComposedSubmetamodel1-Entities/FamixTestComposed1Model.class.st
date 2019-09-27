Class {
	#name : #FamixTestComposed1Model,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedSubmetamodel1-Entities'
}

{ #category : #meta }
FamixTestComposed1Model class >> annotation [
	<MSEClass: #FamixTestComposed1Model super: #MooseModel>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
]

{ #category : #initialization }
FamixTestComposed1Model >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixTestComposedSubmetamodel1Generator) metamodel
]
