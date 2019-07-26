Class {
	#name : #FamixTestComposed2MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedSubmetamodel2-Entities'
}

{ #category : #initialization }
FamixTestComposed2MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTestComposedSubmetamodel2Generator) metamodel
]
