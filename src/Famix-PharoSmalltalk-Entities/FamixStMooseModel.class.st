Class {
	#name : #FamixStMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-PharoSmalltalk-Entities'
}

{ #category : #initialization }
FamixStMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]
