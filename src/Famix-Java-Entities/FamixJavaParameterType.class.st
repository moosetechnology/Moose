Class {
	#name : #FamixJavaParameterType,
	#superclass : #FamixJavaType,
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterType class >> annotation [

	<MSEClass: #ParameterType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaParameterType >> isParameterType [
	^ true
]
