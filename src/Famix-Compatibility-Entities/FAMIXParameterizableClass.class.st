Class {
	#name : #FAMIXParameterizableClass,
	#superclass : #FAMIXClass,
	#traits : 'FamixTWithParameterizedTypes',
	#classTraits : 'FamixTWithParameterizedTypes classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXParameterizableClass class >> annotation [

	<MSEClass: #ParameterizableClass super: #FAMIXClass>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXParameterizableClass class >> generatedSlotNames [
	<generated>
	'FAMIXParameterizableClass class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXParameterizableClass class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithParameterizedTypes)
]

{ #category : #meta }
FAMIXParameterizableClass class >> requirements [

	<generated>
	^ {  }
]

{ #category : #generated }
FAMIXParameterizableClass >> parameters [
	<MSEProperty: #parameters type: #FAMIXParameterType> <multivalued> <derived>
	<MSEComment: 'Parameter types of this class.'>
	
	^self types select: [:each | each isParameterType]
]

{ #category : #generated }
FAMIXParameterizableClass >> parameters: aCollection [

	self privateState attributeAt: #parameters put: aCollection
]
