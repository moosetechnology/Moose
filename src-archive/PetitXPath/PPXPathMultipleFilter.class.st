"
I filter collections. 
I answer the unique element if collection size = 1, or the full collection if is bigger. 
"
Class {
	#name : #PPXPathMultipleFilter,
	#superclass : #PPXPathFilter,
	#category : #'PetitXPath-Nodes'
}

{ #category : #printing }
PPXPathMultipleFilter >> printOn: aStream [
	aStream nextPut: $*    
]

{ #category : #resolving }
PPXPathMultipleFilter >> resolveOn: anArray [
	^ anArray size = 1
		ifTrue: [ anArray first ]
		ifFalse: [ anArray ]
]
