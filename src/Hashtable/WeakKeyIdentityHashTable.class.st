"
I am a replacement for WEakKeyIdentityDictionary that uses chaining instead of linear probing for collision resolution.

This results in a much better performance for big Collections.
"
Class {
	#name : #WeakKeyIdentityHashTable,
	#superclass : #WeakKeyHashTable,
	#category : #Hashtable
}

{ #category : #private }
WeakKeyIdentityHashTable >> hashFor: anObject [
	^ anObject identityHash
]

{ #category : #private }
WeakKeyIdentityHashTable >> is: anObject sameAs: anotherObject [
	^ anObject == anotherObject
]
