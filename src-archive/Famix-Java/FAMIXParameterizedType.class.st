"
FAMIXParameterizedType represents a type with arguments. So, it is an instantiation for the use of FAMIXParameterizableClass. It can appear as a type of an attribute, a type of a local variable, a parameter of a method, a return of a method, etc.
Example:

...
public Map<String,Collection> anAttribute;
...

Where Map<String,Collection> is the FAMIXParameterizedType of anAttribute. String and Collection are arguments. Map is the parameterizableClass.
"
Class {
	#name : #FAMIXParameterizedType,
	#superclass : #FAMIXType,
	#instVars : [
		'arguments',
		'parameterizableClass'
	],
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXParameterizedType class >> annotation [
	<MSEClass: #ParameterizedType super: #FAMIXType>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXParameterizedType >> allSubclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSubclassesDo: aBlock ]
]

{ #category : #accessing }
FAMIXParameterizedType >> allSuperclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSuperclassesDo: aBlock ]
]

{ #category : #accessing }
FAMIXParameterizedType >> arguments [
	<MSEProperty: #arguments type: #FAMIXType opposite: #argumentsInParameterizedTypes> <multivalued>
	<MSEComment: 'Argument types of this parameterized type.'>
	
	^ arguments
]

{ #category : #accessing }
FAMIXParameterizedType >> arguments: aCollection [
	arguments value: aCollection.
	self resetMooseName
]

{ #category : #'initialize-release' }
FAMIXParameterizedType >> initialize [ 
	super initialize.
	arguments := FMMultiMultivalueLink on: self opposite: #argumentsInParameterizedTypes
]

{ #category : #testing }
FAMIXParameterizedType >> isParameterizedType [
	^ true
]

{ #category : #printing }
FAMIXParameterizedType >> mooseNameOn: aStream [ 
	self parameterizableClass notNil 
		ifTrue: [self parameterizableClass mooseNameOn: aStream].
	aStream nextPut: $<.
	self arguments 
		do: [:each | each mooseNameOn: aStream]
		separatedBy: [aStream nextPut: $,].  
	aStream nextPut: $>.  

]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameterizedType >> namespaceScope [
	"we ask the namespaceScope of the parameterizable class"
	
	^ self parameterizableClass ifNotNil: [
		self parameterizableClass namespaceScope ]
]

{ #category : #accessing }
FAMIXParameterizedType >> parameterizableClass [
	<MSEProperty: #parameterizableClass type: #FAMIXParameterizableClass opposite: #parameterizedTypes>
	<MSEComment: 'Base type of this parameterized type.'>
	
	^ parameterizableClass
]

{ #category : #accessing }
FAMIXParameterizedType >> parameterizableClass: aParameterizableClass [

	parameterizableClass := FMMultivalueLink 
		on: self
		update: #parameterizedTypes
		from: self parameterizableClass
		to: aParameterizableClass.
	self resetMooseName
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameterizedType >> yourScope [

	^ #typeScope
]
