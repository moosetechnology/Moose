"
Description
--------------------

I am an abstract class representing primitive constants.
Primitives types are the most basic data types Fame metamodels can have.

In the current implementation of Fame this can only be:
- A string
- A number
- A boolean

Public API and Key Messages
--------------------

- #isPrimitive 			Return true if the FM3Class is a primitive type.
"
Class {
	#name : #FM3Primitive,
	#superclass : #FM3Constant,
	#category : #'Fame-Core-Model'
}

{ #category : #testing }
FM3Primitive class >> isAbstract [
	^ self = FM3Primitive
]

{ #category : #visiting }
FM3Primitive >> accept: aVisitor [
	aVisitor visitPrimitive: self
]

{ #category : #testing }
FM3Primitive >> isPrimitive [
	^ true
]
