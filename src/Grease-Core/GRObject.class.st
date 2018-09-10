"
A common superclass that ensures consistent initialization behaviour on all platforms and provides #error: methods that signal an instance of WAPlatformError.

Packages that are using Seaside-Platform should normally subclass GRObject instead of Object.
"
Class {
	#name : #GRObject,
	#superclass : #Object,
	#category : #'Grease-Core'
}

{ #category : #'error handling' }
GRObject class >> defaultErrorClass [
	^ GRError
]

{ #category : #'error handling' }
GRObject class >> error: aString [
	^ self defaultErrorClass signal: aString
]

{ #category : #'instance creation' }
GRObject class >> new [
	^ self basicNew initialize
]

{ #category : #'error handling' }
GRObject >> error: aString [
	^ self class error: aString
]

{ #category : #initialization }
GRObject >> initialize [
]
