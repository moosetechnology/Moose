"
I'm a filter by index. 
I answer an indexed element in a collection.
"
Class {
	#name : #PPXPathIndexFilter,
	#superclass : #PPXPathFilter,
	#instVars : [
		'index'
	],
	#category : #'PetitXPath-Nodes'
}

{ #category : #'instance creation' }
PPXPathIndexFilter class >> withIndex: aNumber [
	^self basicNew 
		initialize: aNumber;
		yourself  
]

{ #category : #accessing }
PPXPathIndexFilter >> index [ 
	^index
]

{ #category : #initialization }
PPXPathIndexFilter >> initialize: aNumber [
	index := aNumber.
	self initialize    
]

{ #category : #printing }
PPXPathIndexFilter >> printOn: aStream [
	aStream 
		nextPut: $[;
		nextPutAll: self index asString;  
		nextPut: $]
]

{ #category : #resolving }
PPXPathIndexFilter >> resolveOn: anArray [
	self index <= anArray size
		ifFalse: [ ^ nil ].
	^anArray at: self index 
	  
]
