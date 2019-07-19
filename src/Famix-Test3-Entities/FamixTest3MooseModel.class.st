Class {
	#name : #FamixTest3MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test3-Entities'
}

{ #category : #initialization }
FamixTest3MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTest3Generator) metamodel
]
