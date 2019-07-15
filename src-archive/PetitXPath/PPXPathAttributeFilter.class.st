"
I'm a filter by attribute. 
I check that an attribute matches with its value (or any if specified) 

"
Class {
	#name : #PPXPathAttributeFilter,
	#superclass : #PPXPathFilter,
	#instVars : [
		'name',
		'value'
	],
	#category : #'PetitXPath-Nodes'
}

{ #category : #'instance creation' }
PPXPathAttributeFilter class >> withName: nameString value: valueString [
	^self basicNew 
		initializeName: nameString value: valueString;
		yourself  
]

{ #category : #initialization }
PPXPathAttributeFilter >> initializeName: nameString value: valueString [
	name := nameString allButFirst.
	value := valueString.
	self initialize    
]

{ #category : #accessing }
PPXPathAttributeFilter >> name [ 
	^ name
]

{ #category : #printing }
PPXPathAttributeFilter >> printOn: aStream [
	aStream 
		nextPut: $[;
		nextPut: $@;
		nextPutAll: self name;
		nextPut: $=;
		nextPut: $"; nextPutAll: self value; nextPut: $";   
		nextPut: $]
]

{ #category : #resolving }
PPXPathAttributeFilter >> resolveOn: anArray [
	| result | 
	
	result := anArray select: [ :each | | attrValue |
		attrValue := each attributeAt: self name.
		attrValue notNil 
			and: [ (attrValue = self value) or: [ self value = '*' ] ] ].
		
	result ifEmpty: [ ^ nil ].
	result size = 1 ifTrue: [ ^ result first ].
	^ result
]

{ #category : #accessing }
PPXPathAttributeFilter >> value [
	^ value
]
