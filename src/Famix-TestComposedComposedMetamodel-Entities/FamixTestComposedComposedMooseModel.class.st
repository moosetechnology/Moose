Class {
	#name : #FamixTestComposedComposedMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedComposedMetamodel-Entities'
}

{ #category : #initialization }
FamixTestComposedComposedMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTestComposedComposedGenerator) metamodel
]
