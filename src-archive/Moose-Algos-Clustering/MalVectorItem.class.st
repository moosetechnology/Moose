"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalVectorItem,
	#superclass : #MalVectorDecorator,
	#instVars : [
		'item'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #'instance creation' }
MalVectorItem class >> with: anElement and: aVector [
	
	^(self on: aVector)
		item: anElement;
		yourself
]

{ #category : #'instance creation' }
MalVectorItem class >> with: anElement andAll: aCollection [
	
	^(self on: (MalArrayVector withAll: aCollection))
		item: anElement;
		yourself
]

{ #category : #accessing }
MalVectorItem >> = anObject [
	
	^super = anObject
		or: [(anObject isKindOf: MalVectorItem) and: [self item = anObject item]]
]

{ #category : #'distance functions' }
MalVectorItem >> dist: anItem [
	
	^self vector dist: anItem vector
]

{ #category : #accessing }
MalVectorItem >> item [
	
	^item
]

{ #category : #accessing }
MalVectorItem >> item: anObject [
	
	item := anObject
]

{ #category : #printing }
MalVectorItem >> printOn: aStream [
	
	item printOn: aStream
]

{ #category : #accessing }
MalVectorItem >> vector [
	
	^vector
]

{ #category : #accessing }
MalVectorItem >> vector: anObject [
	
	vector := anObject
]
