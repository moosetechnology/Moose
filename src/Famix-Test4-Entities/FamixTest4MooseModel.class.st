Class {
	#name : #FamixTest4MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test4-Entities'
}

{ #category : #initialization }
FamixTest4MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTest4Generator) metamodel
]
