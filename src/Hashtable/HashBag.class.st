"
I am a replacement for Bag that uses chaining instead of linear probing for collision resolution.

This results in a much better performance for big Collections.
"
Class {
	#name : #HashBag,
	#superclass : #Bag,
	#category : #Hashtable
}

{ #category : #'instance creation' }
HashBag class >> contentsClass [
	^HashTable
]
