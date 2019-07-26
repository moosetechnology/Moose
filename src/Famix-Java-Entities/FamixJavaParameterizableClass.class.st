Class {
	#name : #FamixJavaParameterizableClass,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTWithParameterizedTypes',
	#classTraits : 'FamixTWithParameterizedTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterizableClass class >> annotation [

	<MSEClass: #ParameterizableClass super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaParameterizableClass >> parameters [
	<MSEProperty: #parameters type: #FamixJavaParameterType> <multivalued> <derived>
	<MSEComment: 'Parameter types of this class.'>
	
	^self types select: [:each | each isParameterType]
]

{ #category : #'as yet unclassified' }
FamixJavaParameterizableClass >> parameters: aCollection [

	self privateState attributeAt: #parameters put: aCollection
]
