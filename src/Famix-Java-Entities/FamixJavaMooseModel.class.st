Class {
	#name : #FamixJavaMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Java-Entities'
}

{ #category : #meta }
FamixJavaMooseModel class >> annotation [
	<MSEClass: #FamixJavaMooseModel super: #MooseModel>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : #initialization }
FamixJavaMooseModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixJavaGenerator) metamodel
]
