Class {
	#name : #FamixJavaFile,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaFile class >> annotation [

	<FMClass: #File super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixJavaFile >> isSourceCodeLoaded [
	self propertyNamed: #sourceText ifAbsentPut: [ ^ false].
	^ true
]
