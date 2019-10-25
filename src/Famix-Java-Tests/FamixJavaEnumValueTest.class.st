Class {
	#name : #FamixJavaEnumValueTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaEnumValueTest >> testParentEnum [
	| enum value |
	enum := FamixJavaEnum new.
	value := FamixJavaEnumValue new.
	value parentEnum: enum.
	self assert: enum values size equals: 1.
	self assert: value parentEnum equals: enum
]
