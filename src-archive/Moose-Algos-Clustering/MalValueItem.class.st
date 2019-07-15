"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalValueItem,
	#superclass : #Association,
	#category : #'Moose-Algos-Clustering'
}

{ #category : #'distance functions' }
MalValueItem >> dist: anItem [
	
	^self value dist: anItem value
]

{ #category : #accessing }
MalValueItem >> item [
	
	^self key
]

{ #category : #accessing }
MalValueItem >> item: anObject [
	
	^self key: anObject
]

{ #category : #'distance functions' }
MalValueItem >> similarity: anItem [
	
	^self value similarity: anItem value
]
