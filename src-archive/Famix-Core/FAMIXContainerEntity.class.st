"
FAMIXContainerEntity is the abstract superclass for source code entities containing other entities. Types, methods, and packages are examples of FAMIXContainerEntity.


"
Class {
	#name : #FAMIXContainerEntity,
	#superclass : #FAMIXNamedEntity,
	#traits : 'TOODependencyQueries - {#incomingTypeDeclarations. #outgoingTypeDeclarations}',
	#classTraits : 'TOODependencyQueries classTrait',
	#instVars : [
		'types',
		'functions'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXContainerEntity class >> annotation [
	<MSEClass: #ContainerEntity super: #FAMIXNamedEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXContainerEntity >> addFunction: aFunction [ 
	functions add: aFunction
]

{ #category : #accessing }
FAMIXContainerEntity >> addType: aType [ 
	types add: aType
]

{ #category : #accessing }
FAMIXContainerEntity >> functions [
	<MSEProperty: #functions type: #FAMIXFunction opposite: #container>	<multivalued>	<derived>
	<MSEComment: 'Functions defined in the container, if any.'>
	
	^ functions
]

{ #category : #accessing }
FAMIXContainerEntity >> functions: aCollectionOfFunctions [
	functions value: aCollectionOfFunctions
]

{ #category : #'initialize-release' }
FAMIXContainerEntity >> initialize [
	super initialize.
	types := FMNullMultivalueLink on: self opposite: #container: selector: #types.
	functions := FMNullMultivalueLink on: self opposite: #container: selector: #functions
]

{ #category : #accessing }
FAMIXContainerEntity >> numberOfChildren [
	<MSEProperty: #numberOfChildren type: #Number>
	<MSEComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	
	^ self children size
]

{ #category : #accessing }
FAMIXContainerEntity >> types [
	<MSEProperty: #types type: #FAMIXType opposite: #container> <multivalued> <derived>
	<MSEComment: 'Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.'>
	
	^types
]

{ #category : #accessing }
FAMIXContainerEntity >> types: aCollection [
	types value: aCollection
]
