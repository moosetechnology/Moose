Class {
	#name : #FamixEnumValueTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixEnumValueTest >> testParentEnum [
	| enum value |
	enum := FAMIXEnum new.
	value := FAMIXEnumValue new.
	value parentEnum: enum.
	self assert: enum values size equals: 1.
	self assert: value parentEnum equals: enum
]
