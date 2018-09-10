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
