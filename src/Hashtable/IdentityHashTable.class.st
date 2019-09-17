"
I am a replacement for IdentityDictionary that uses chaining instead of linear probing for collision resolution.

This results in a much better performance for big Collections.
"
Class {
	#name : #IdentityHashTable,
	#superclass : #HashTable,
	#category : #Hashtable
}

{ #category : #private }
IdentityHashTable >> hashFor: anObject [
	^ anObject identityHash
]

{ #category : #private }
IdentityHashTable >> is: anObject sameAs: anotherObject [
	^ anObject == anotherObject
]
