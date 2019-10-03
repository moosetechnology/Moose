"
Description
--------------------

I am an abstract class part of a Design Pattern Strategy. 

With my subclasses we manage the direction of the MooseQueries and everything related to direction in the queries.

I am able to return the right strategy to use in a query with the method #fromSymbol. This method takes a symbol representing a direction as parameter and return the right strategy. 

Example
-------------------

	MooseQueryAbstractDirectionStrategy fromSymbol: #in
"
Class {
	#name : #MooseQueryAbstractDirectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Strategies'
}

{ #category : #accessing }
MooseQueryAbstractDirectionStrategy class >> allAssociationTypesFor: anEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
MooseQueryAbstractDirectionStrategy class >> associationTypesFor: anEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
MooseQueryAbstractDirectionStrategy class >> determinatingSymbol [
	"I should return a Symbol representing a direction. For example an Incoming direction will have #in as determinating symbol."

	^ self subclassResponsibility
]

{ #category : #'instance creation' }
MooseQueryAbstractDirectionStrategy class >> fromSymbol: aSymbol [
	"I return the right strategy from a Symbol representing a direction"

	^ self allSubclasses detect: [ :each | each determinatingSymbol = aSymbol ] ifNone: [ self error: 'The symbol passed to the query should be either #in or #out. Here we got ' , aSymbol asString ]
]

{ #category : #accessing }
MooseQueryAbstractDirectionStrategy class >> msePropertiesOf: anEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
MooseQueryAbstractDirectionStrategy class >> queryResultOn: anEntity with: aCollection [
	^ self subclassResponsibility
]

{ #category : #accessing }
MooseQueryAbstractDirectionStrategy class >> symbolToCollectEntities [
	"I should return a Symbol to collect entities. For example an Incoming direction will have #source as symbol to collect entities."

	^ self subclassResponsibility
]
