Class {
	#name : #HashBag,
	#superclass : #Bag,
	#category : #Hashtable
}

{ #category : #'instance creation' }
HashBag class >> contentsClass [
	^HashTable
]
