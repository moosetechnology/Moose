Class {
	#name : #FamixTest1MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test1-Entities'
}

{ #category : #initialization }
FamixTest1MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTest1Generator) metamodel
]
