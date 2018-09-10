Class {
	#name : #IdentityHashBag,
	#superclass : #Bag,
	#category : #Hashtable
}

{ #category : #'instance creation' }
IdentityHashBag class >> contentsClass [
	^IdentityHashTable
]
