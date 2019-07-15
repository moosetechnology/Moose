Class {
	#name : #MalMedianAccumulator,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalMedianAccumulator class >> new [
	
	^self basicNew initialize
]

{ #category : #'instance creation' }
MalMedianAccumulator class >> withAll: aCollection [
	
	^(self new)
		addAll: aCollection;
		yourself
]

{ #category : #accumulating }
MalMedianAccumulator >> add: value [
	
	values add: value
]

{ #category : #accumulating }
MalMedianAccumulator >> addAll: aCollection [
	
	values addAll: aCollection
]

{ #category : #accessing }
MalMedianAccumulator >> bottom [
	
	^values last
]

{ #category : #accessing }
MalMedianAccumulator >> firstQuartil [
	
	^values at: (values size / 4) asInteger
]

{ #category : #'initialize-release' }
MalMedianAccumulator >> initialize [
	
	values := SortedCollection new
]

{ #category : #accessing }
MalMedianAccumulator >> median [
	
	^values at: (values size / 2) asInteger
]

{ #category : #printing }
MalMedianAccumulator >> printOn: aStream [
	
	aStream
		nextPutAll: 'Median = ';
		print: self median;
		space;
		nextPut: $(;
		print: self top;
		nextPut: $;;
		space;
		print: self firstQuartil;
		nextPut: $;;
		space;
		print: self median;
		nextPut: $;;
		space;
		print: self thirdQuartil;
		nextPut: $;;
		space;
		print: self bottom;
		nextPut: $)
]

{ #category : #accessing }
MalMedianAccumulator >> thirdQuartil [
	
	^values at: (values size / 4 * 3) asInteger
]

{ #category : #accessing }
MalMedianAccumulator >> top [
	
	^values first
]

{ #category : #accumulating }
MalMedianAccumulator >> value: value [
	
	values add: value
]
