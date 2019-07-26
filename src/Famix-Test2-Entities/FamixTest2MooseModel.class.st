Class {
	#name : #FamixTest2MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test2-Entities'
}

{ #category : #initialization }
FamixTest2MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTest2Generator) metamodel
]
