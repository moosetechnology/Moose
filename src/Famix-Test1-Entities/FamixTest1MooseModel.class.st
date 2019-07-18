Class {
	#name : #FamixTest1MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test1-Entities'
}

{ #category : #initialization }
FamixTest1MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: FamixTest1Generator metamodel
]
