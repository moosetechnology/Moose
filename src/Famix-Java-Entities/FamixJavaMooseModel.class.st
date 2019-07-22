Class {
	#name : #FamixJavaMooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Java-Entities'
}

{ #category : #'as yet unclassified' }
FamixJavaMooseModel >> allParameterTypes [
	<navigation: 'All parameter types'>
	<package: #Java>
	^ self allWithType: FamixJavaParameterType
]

{ #category : #initialization }
FamixJavaMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FamixJavaGenerator) metamodel
]
