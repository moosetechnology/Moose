Class {
	#name : #FM3Primitive,
	#superclass : #FM3Constant,
	#category : #'Fame-Core'
}

{ #category : #testing }
FM3Primitive class >> isAbstract [
	^ self = FM3Primitive
]

{ #category : #'accessing-query' }
FM3Primitive >> isPrimitive [
	^ true
]
