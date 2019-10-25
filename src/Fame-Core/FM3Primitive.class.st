Class {
	#name : #FM3Primitive,
	#superclass : #FM3Constant,
	#category : #'Fame-Core-Model'
}

{ #category : #testing }
FM3Primitive class >> isAbstract [
	^ self = FM3Primitive
]

{ #category : #testing }
FM3Primitive >> isPrimitive [
	^ true
]
