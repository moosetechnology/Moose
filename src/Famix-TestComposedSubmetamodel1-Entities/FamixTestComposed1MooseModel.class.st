Class {
	#name : #FamixTestComposed1MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-TestComposedSubmetamodel1-Entities'
}

{ #category : #initialization }
FamixTestComposed1MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixTestComposedSubmetamodel1Generator) metamodel
]
