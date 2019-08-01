Class {
	#name : #FamixJavaEnumTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaEnumTest >> testValues [
	| enum value |
	enum := FamixJavaEnum new.
	value := FamixJavaEnumValue new.
	enum values: (OrderedCollection with: value).
	self assert: enum values size equals: 1.
	self assert: value parentEnum equals: enum
]
