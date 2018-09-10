"
Implementation:
copy methods from IdentifyHashTable here

Yes this is ugly, give me Traits and I will fix it.
"
Class {
	#name : #IdentityHashSet,
	#superclass : #HashSet,
	#category : #Hashtable
}

{ #category : #private }
IdentityHashSet >> hashFor: anObject [
	^ anObject identityHash
]

{ #category : #private }
IdentityHashSet >> is: anObject sameAs: anotherObject [
	^ anObject == anotherObject
]
