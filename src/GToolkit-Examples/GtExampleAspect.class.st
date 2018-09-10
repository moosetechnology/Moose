"
I encapsulate an object that provides functionality for an example. Aspects are configured by using paragmas in the method defining the example.
"
Class {
	#name : #GtExampleAspect,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleAspect class >> isAbstract [
	^ self == GtExampleAspect
]

{ #category : #testing }
GtExampleAspect >> exists [
	^ false
]

{ #category : #ui }
GtExampleAspect >> gtDisplayValidityOn: aStream [
	self isValid ifTrue: [ ^ self ].
	
	self exists ifFalse: [ ^ aStream nextPutAll: ' [does not exist]' ].
	aStream nextPutAll: ' [invalid]'
]

{ #category : #testing }
GtExampleAspect >> hasLiteralThorough: aLiteral [
	^ false
]

{ #category : #testing }
GtExampleAspect >> isAbstract [
	^ self class isAbstract
]

{ #category : #testing }
GtExampleAspect >> isValid [
	^ self exists
]
