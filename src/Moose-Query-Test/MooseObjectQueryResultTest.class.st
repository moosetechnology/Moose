Class {
	#name : #MooseObjectQueryResultTest,
	#superclass : #MooseQueryResultTest,
	#category : #'Moose-Query-Test'
}

{ #category : #asserting }
MooseObjectQueryResultTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
MooseObjectQueryResultTest >> actualClass [
	^ MooseObjectQueryResult
]
