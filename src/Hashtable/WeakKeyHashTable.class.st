Class {
	#name : #WeakKeyHashTable,
	#superclass : #HashTable,
	#category : #Hashtable
}

{ #category : #adding }
WeakKeyHashTable >> at: aKey put: aValue [
	aKey ifNil: [self error: 'WeakKeyHashTables cannot meaningfully contain nil as an element'].
	^super at: aKey put: aValue
]

{ #category : #private }
WeakKeyHashTable >> fixAt: anInteger [
	"remove all items at an index in the table who's key is garbage collected"
	| item lastItem |
	item := self table at: anInteger.
	
	[ item notNil and: [item key isNil ] ]
		whileTrue: [
			item := item next.
			self table at: anInteger put: item.
			self decrementSize ].
		
	item := self table at: anInteger.
	lastItem := item.
	[ item notNil ]
		whileTrue: [ 
			lastItem := item.
			item := item next.			
						
			[ item notNil and: [ item key isNil ] ]
				whileTrue: [
					item := item next.
					lastItem next: item.
					self decrementSize ] ].
]

{ #category : #private }
WeakKeyHashTable >> itemClass [
	^WeakKeyTableItem
]

{ #category : #private }
WeakKeyHashTable >> itemFor: aKey atIndex: anInteger [
	| item |
	
	self fixAt: anInteger.
	item := self table at: anInteger.	
		
	[ item notNil ]
		whileTrue: [
			(self is: item key sameAs: aKey)
				ifTrue: [ ^item ].
			item := item next ].
	^nil
]

{ #category : #enumerating }
WeakKeyHashTable >> keysAndValuesDo: aBlock [
	self table withIndexDo: [ :each :index |
		| current |
		self fixAt: index.
		current := each.
		[ current notNil ] whileTrue:  [
			aBlock value: current key value: current value.
			current := current next ] ]
]
