Class {
	#name : #FamixJavaMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Java-Entities'
}

{ #category : #initialization }
FamixJavaMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixJavaGenerator) metamodel
]
