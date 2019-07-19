Class {
	#name : #FamixMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Traits'
}

{ #category : #initialization }
FamixMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixGenerator) metamodel
]
