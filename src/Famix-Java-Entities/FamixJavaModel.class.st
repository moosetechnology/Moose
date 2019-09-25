Class {
	#name : #FamixJavaModel,
	#superclass : #MooseModel,
	#category : #'Famix-Java-Entities'
}

{ #category : #meta }
FamixJavaModel class >> annotation [
	<MSEClass: #FamixJavaModel super: #MooseModel>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : #initialization }
FamixJavaModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FamixJavaGenerator) metamodel
]
