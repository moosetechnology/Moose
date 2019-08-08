Class {
	#name : #FamixTestComposed3MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposed3Metamodel-Entities'
}

{ #category : #initialization }
FamixTestComposed3MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTestComposed3Generator) metamodel
]
