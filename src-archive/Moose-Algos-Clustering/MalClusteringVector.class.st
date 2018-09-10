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
	"| min0 found0 |"

	found ifNil: [ self update ].	"min0 := Unlimited positive.
	1 to: self size do: [ :index |
		(self at: index) < min0 
			ifTrue: [ min0 := (self at: index). found0 := index ]].
	[ found0 = found ] assert."
	^ min
]

{ #category : #accessing }
MalClusteringVector >> unsetAt: index [
	
	super
		at: index
		put: MalUnlimited positive.
	found = index ifTrue: [found := nil]
]

{ #category : #private }
MalClusteringVector >> update [
	
	min := MalUnlimited positive.
	1
		to: self size
		do:
			[:tmpIndex | 
			(self at: tmpIndex) < min
				ifTrue:
					[min := self at: tmpIndex.
					found := tmpIndex]]
]
