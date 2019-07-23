Class {
	#name : #FamixTestComposedMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedMetamodel-Entities'
}

{ #category : #initialization }
FamixTestComposedMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTestComposedGenerator) metamodel
]
