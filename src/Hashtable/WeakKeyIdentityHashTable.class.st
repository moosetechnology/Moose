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
