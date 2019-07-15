"
ParameterType represents the symbolic type used in parameterizable classes. This is a FAMIXType.

Example:
public class AClass<A,B,C> {
...
}

Where AClass is a ParameterizableClass. A, B and C are ParameterType of AClass.
"
Class {
	#name : #FAMIXParameterType,
	#superclass : #FAMIXType,
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXParameterType class >> annotation [
	<MSEClass: #ParameterType super: #FAMIXType>
	<package: #FAMIX>
]

{ #category : #testing }
FAMIXParameterType >> isParameterType [
	^ true
]
