Class {
	#name : #FAMIXMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Compatibility-Entities'
}

{ #category : #initialization }
FAMIXMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixCompatibilityGenerator) metamodel
]
