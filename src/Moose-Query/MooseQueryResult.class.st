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
	#category : #'Moose-Query'
}

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
MooseQueryResult >> allAtScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> allToScope: aSymbol [

	^ self subclassResponsibility
]

{ #category : #scoping }
MooseQueryResult >> allWithScope: aSymbol [
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
MooseQueryResult >> outOfClass: aFAMIXClass [ 
	self subclassResponsibility 
]

{ #category : #filtering }
MooseQueryResult >> outOfMyClass [

	^ self outOfClass: self receiver typeScope

]

{ #category : #filtering }
MooseQueryResult >> outOfMyNamespace [

	^ self outOfNamespace: self receiver namespaceScope   
]

{ #category : #filtering }
MooseQueryResult >> outOfMyPackage [
	
	^ self outOfPackage: self receiver packageScope    
]

{ #category : #filtering }
MooseQueryResult >> outOfNamespace: aFAMIXNamespace [ 
	self subclassResponsibility 
]

{ #category : #filtering }
MooseQueryResult >> outOfPackage: aFAMIXPackage [ 
	self subclassResponsibility 
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
MooseQueryResult >> withScope: aSymbol [
	^ self subclassResponsibility
]

{ #category : #evaluating }
MooseQueryResult >> within: aFAMIXEntity [ 
	 self subclassResponsibility
]

{ #category : #filtering }
MooseQueryResult >> withinClass: aFAMIXClass [ 
	self subclassResponsibility 
]

{ #category : #filtering }
MooseQueryResult >> withinMyClass [

	^ self withinClass: self receiver typeScope

]

{ #category : #filtering }
MooseQueryResult >> withinMyNamespace [

	^ self withinNamespace: self receiver namespaceScope   
]

{ #category : #filtering }
MooseQueryResult >> withinMyPackage [
	
	^ self withinPackage: self receiver packageScope    
]

{ #category : #filtering }
MooseQueryResult >> withinNamespace: aFAMIXNamespace [ 
	self subclassResponsibility 
]

{ #category : #filtering }
MooseQueryResult >> withinPackage: aFAMIXPackage [ 
	self subclassResponsibility 
]
