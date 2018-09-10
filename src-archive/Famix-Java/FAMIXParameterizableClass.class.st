"
ParameterizableClass represents the definition of a generic class with parameters. The parameters of the entity are modeled as ParameterType.

Example:
public class AClass<A,B,C> {
...
}

Where AClass is a ParameterizableClass. A, B and C are ParameterType of AClass.
"
Class {
	#name : #FAMIXParameterizableClass,
	#superclass : #FAMIXClass,
	#instVars : [
		'parameterizedTypes'
	],
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXParameterizableClass class >> annotation [
	<MSEClass: #ParameterizableClass super: #FAMIXClass>
	<package: #FAMIX>
]

{ #category : #initialization }
FAMIXParameterizableClass >> initialize [
	super initialize.
	parameterizedTypes := FMMultivalueLink 
		on: self
		opposite: #parameterizableClass:
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameterizableClass >> parameterizedTypes [
	<MSEProperty: #parameterizedTypes type: #FAMIXParameterizedType opposite: #parameterizableClass>
	<multivalued> <derived>
	^ parameterizedTypes
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameterizableClass >> parameterizedTypes: aCollection [
	parameterizedTypes value: aCollection
]

{ #category : #accessing }
FAMIXParameterizableClass >> parameters [
	<MSEProperty: #parameters type: #FAMIXParameterType> <multivalued> <derived>
	<MSEComment: 'Parameter types of this class.'>
	
	^self types select: [:each | each isParameterType]
]

{ #category : #accessing }
FAMIXParameterizableClass >> parameters: aCollection [

	self privateState attributeAt: #parameters put: aCollection
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameterizableClass >> yourScope [

	^ #typeScope
]

