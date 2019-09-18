Class {
	#name : #FamixCSharpMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-CSharp-Entities'
}

{ #category : #initialization }
FamixCSharpMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixCSharpGenerator) metamodel
]
