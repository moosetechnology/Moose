"
MooseQueryResult is the abstract class for holding the result of all Moose-Query queries.
By default MooseQueryResults are assumed to contain a collection of associations between the entity in receiver and all the element in storage at the exception of  MooseObjectQueryResult.

For more informations: https://moosequery.ferlicot.fr/

Instance Variables:
	storage	the elements resulting of the queries
	receiver	the receiver of the query, necessary for example when we want to do a withoutSelfLoop
"
Class {
	#name : #MooseQueryResult,
	#superclass : #Collection,
	#instVars : [
		'storage',
		'receiver'
	],
	#category : #'Moose-Query-Results'
}

{ #category : #'instance creation' }
MooseQueryResult class >> new: nElements [
	^ self new
		storage: (OrderedCollection new: nElements);
		yourself
]

{ #category : #'instance creation' }
MooseQueryResult class >> on: aSourceObject withAll: aCollection [

	^ self new
		receiver: aSourceObject;
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
MooseQueryResult >> = aQueryResult [ 
	super = aQueryResult ifTrue: [^ true].
	self species == aQueryResult species ifFalse: [^ false].
	^ self storage = aQueryResult storage
]

{ #category : #adding }
MooseQueryResult >> add: newObject [
	"Include newObject as one of the receiver's elements. Answer newObject. 
	ArrayedCollections cannot respond to this message."

	^ storage add: newObject 
]

{ #category : #scoping }
MooseQueryResult >> allAtAnyScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> allAtScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> allToAnyScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> allToScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> allWithAnyScope: aSymbol [
	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> allWithScope: aSymbol [
	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> atAnyScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> atScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #enumerating }
MooseQueryResult >> collect: aBlock [
	^ (super collect: aBlock)
		receiver: self receiver;
		yourself
]

{ #category : #enumerating }
MooseQueryResult >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	^ storage do: aBlock 
]

{ #category : #'initialize-release' }
MooseQueryResult >> initialize [

	super initialize.
	self initialize: OrderedCollection new
]

{ #category : #'initialize-release' }
MooseQueryResult >> initialize: aCollectionForStorage [

	storage := aCollectionForStorage 
]

{ #category : #enumerating }
MooseQueryResult >> intersection: aCollection [
	| result |
	
	result := self class new.
	
	aCollection do: [ :each|
		((self includes: each) and: [(result includes: each) not])
				ifTrue: [ result add: each]].
		
	^ result
]

{ #category : #'initialize-release' }
MooseQueryResult >> newObjectResultWith: aCollection [

	^ MooseObjectQueryResult on: self receiver withAll: aCollection
]

{ #category : #filtering }
MooseQueryResult >> outOf: aFAMIXEntity [
	"Return the results which are out the entity as parameter."

	^ self subclassResponsibility
]

{ #category : #filtering }
MooseQueryResult >> outOfParentUsing: aFamixTrait [
	^ self outOf: (self receiver atScope: aFamixTrait) anyOne
]

{ #category : #accessing }
MooseQueryResult >> receiver [
	^ receiver
]

{ #category : #accessing }
MooseQueryResult >> receiver: anObject [
	receiver := anObject
]

{ #category : #enumerating }
MooseQueryResult >> reject: aBlock [
	^ (super reject: aBlock)
		receiver: self receiver;
		yourself
]

{ #category : #removing }
MooseQueryResult >> remove: oldObject ifAbsent: anExceptionBlock [
	"Remove oldObject from the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	^ storage remove: oldObject ifAbsent: anExceptionBlock 
]

{ #category : #enumerating }
MooseQueryResult >> select: aBlock [
	^ (super select: aBlock)
		receiver: self receiver;
		yourself
]

{ #category : #accessing }
MooseQueryResult >> storage [

	^ storage
]

{ #category : #accessing }
MooseQueryResult >> storage: aCollection [ 
	storage := aCollection
]

{ #category : #scoping }
MooseQueryResult >> toAnyScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> toScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #enumerating }
MooseQueryResult >> union: aCollection [

	| set |
	
	set := self asSet addAll: aCollection; yourself.
	
	 ^ self class on: (self receiver) withAll: set
]

{ #category : #scoping }
MooseQueryResult >> withAnyScope: aSymbol [
	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> withScope: aSymbol [
	^ self subclassResponsibility
]

{ #category : #filtering }
MooseQueryResult >> within: aFAMIXEntity [
	"Return the results which are in the entity as parameter."

	^ self subclassResponsibility
]

{ #category : #filtering }
MooseQueryResult >> withinParentUsing: aFamixTrait [
	^ self within: (self receiver atScope: aFamixTrait) anyOne
]

{ #category : #accessing }
MooseQueryResult >> withoutSelfLoops [
	^ self subclassResponsibility
]
