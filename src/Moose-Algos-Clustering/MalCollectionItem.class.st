"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalCollectionItem,
	#superclass : #Collection,
	#instVars : [
		'item',
		'collection'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #adding }
MalCollectionItem >> add: newObject [
	" *** This method was defined by Collection as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
MalCollectionItem >> collection [
	
	^collection
]

{ #category : #accessing }
MalCollectionItem >> collection: anObject [
	
	collection := anObject
]

{ #category : #enumerating }
MalCollectionItem >> do: aBlock [
	" *** This method was defined by Collection as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
MalCollectionItem >> item [
	
	^item
]

{ #category : #accessing }
MalCollectionItem >> item: anObject [
	
	item := anObject
]

{ #category : #removing }
MalCollectionItem >> remove: oldObject ifAbsent: anExceptionBlock [
	" *** This method was defined by Collection as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]
