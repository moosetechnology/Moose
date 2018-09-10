"
I describe collection item at concrete collection index or dictionary key. 

	#(one two) should include: #one at: 1

My instance can be created by:

	SpecOfCollectionItem at: 1 requiredItem: #one.
	
Required item can be a simple object like in example or it can be full specification:

	#(one two) should include: (Kind of: String ) at: 1		

Also you can use a block: 

	#(one two) should include: [:item | item isAllDigits] at: 1

Block is converted to predicate specification.
			 
Internal Representation and Key Implementation Points.

    Instance Variables
	containingKey:		<Object>
	requiredItem:		<SpecOfObjectState>
"
Class {
	#name : #SpecOfCollectionItem,
	#superclass : #SpecOfCollection,
	#instVars : [
		'containingKey',
		'requiredItem'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfCollectionItem class >> at: keyObject requiredItem: itemObject [
	^self new
		containingKey: keyObject;
		requiredItem: itemObject 
]

{ #category : #testing }
SpecOfCollectionItem >> basicMatches: aCollection [
	| actualItem |
	actualItem := aCollection at: containingKey ifAbsent: [^false].

	^requiredItem matches: actualItem
]

{ #category : #accessing }
SpecOfCollectionItem >> containingKey [
	^ containingKey
]

{ #category : #accessing }
SpecOfCollectionItem >> containingKey: anObject [
	containingKey := anObject
]

{ #category : #accessing }
SpecOfCollectionItem >> defaultTitle [
	^'include ', requiredItem printSimpleValue, ' at ' , containingKey stringForSpecTitle
]

{ #category : #accessing }
SpecOfCollectionItem >> invertChildren [
	super invertChildren.
	
	requiredItem invert
]

{ #category : #printing }
SpecOfCollectionItem >> itemDescription [
	^requiredItem description
]

{ #category : #accessing }
SpecOfCollectionItem >> requiredItem [
	^ requiredItem
]

{ #category : #accessing }
SpecOfCollectionItem >> requiredItem: anObject [
	requiredItem := anObject asStateSpec
]

{ #category : #validation }
SpecOfCollectionItem >> validate: aCollection [
	| actualItem result |
	
	actualItem := aCollection at: containingKey ifAbsent: [
		^SpecOfCollectionItemValidationFailure noItemIn: aCollection butShouldBe: self ].
	
	result := requiredItem validate: actualItem.
	^result isSuccess 
		ifTrue: [ result ] 
		ifFalse: [ ^SpecOfCollectionItemValidationFailure unexpectedItem: actualItem in: aCollection butShouldBe: self ] 
]
