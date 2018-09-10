"
FAMIXClass represents an entity which can build new instances. A FAMIXClass is a FAMIXType, therefore it is involved in super/sub types relationships (depending on the language) and it holds attributes, methods.

FAMIX does not model explicitly interfaces, but a FAMIXClass can represent a Java interface by setting the isInterface property.

A class is typically scoped in a namespace. To model nested or anonymous classes, extractors can set the container of classes to classes or methods, respectively.
"
Class {
	#name : #FAMIXClass,
	#superclass : #FAMIXType,
	#instVars : [
		'isInterface'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXClass class >> annotation [
	<MSEClass: #Class super: #FAMIXType>
	<package: #FAMIX>
]

{ #category : #'initialize-release' }
FAMIXClass >> initialize [

	super initialize.
	isInterface := false
]

{ #category : #accessing }
FAMIXClass >> isInterface [
	<MSEProperty: #isInterface type: #Boolean>
	<MSEComment: 'This is a boolean flag used to distinguish between classes with implementation and interfaces. It is particularly relevant for Java systems.'>
	^ isInterface ifNil: [ false ]
]

{ #category : #accessing }
FAMIXClass >> isInterface: boolean [
	isInterface := boolean
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXClass >> selectWithinYourScope: aMooseQueryResult [
	^ aMooseQueryResult withinClass: self
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXClass >> yourScope [

	^ #typeScope
]

