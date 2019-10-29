Class {
	#name : #FAMIXParameterizableClass,
	#superclass : #FAMIXClass,
	#traits : 'FamixTWithParameterizedTypes',
	#classTraits : 'FamixTWithParameterizedTypes classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXParameterizableClass class >> annotation [

	<FMClass: #ParameterizableClass super: #FAMIXClass>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generated }
FAMIXParameterizableClass >> parameters [
	<FMProperty: #parameters type: #FAMIXParameterType> <multivalued> <derived>
	<FMComment: 'Parameter types of this class.'>
	
	^self types select: [:each | each isParameterType]
]

{ #category : #generated }
FAMIXParameterizableClass >> parameters: aCollection [

	self privateState attributeAt: #parameters put: aCollection
]
