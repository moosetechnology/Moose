Class {
	#name : #WeakKeyTableItem,
	#superclass : #TableItem,
	#category : #Hashtable
}

{ #category : #accessing }
WeakKeyTableItem >> key [
	^key first
]

{ #category : #accessing }
WeakKeyTableItem >> key: anObject [
	key := WeakArray with: anObject.
	keyHash := anObject hash.
]
