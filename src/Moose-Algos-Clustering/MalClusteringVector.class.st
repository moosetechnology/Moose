"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalClusteringVector,
	#superclass : #MalArrayVector,
	#type : #variable,
	#instVars : [
		'min',
		'found'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #accessing }
MalClusteringVector >> at: index put: aNumber [
	super at: index put: aNumber.
	(found isNotNil and: [ found = index or: [ aNumber < min ] ])
		ifTrue: [ found := nil ].
	^ aNumber
]

{ #category : #accessing }
MalClusteringVector >> found [
	
	^found
]

{ #category : #accessing }
MalClusteringVector >> min [
	found ifNil: [ self update ].
	^ min
]

{ #category : #accessing }
MalClusteringVector >> unsetAt: index [
	super at: index put: MalUnlimited positive.
	found = index ifTrue: [ found := nil ]
]

{ #category : #private }
MalClusteringVector >> update [
	min := MalUnlimited positive.
	self
		doWithIndex: [ :each :ind | 
			each < min
				ifTrue: [ min := each.
					found := ind ] ]
]
