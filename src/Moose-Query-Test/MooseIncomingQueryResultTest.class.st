Class {
	#name : #MooseIncomingQueryResultTest,
	#superclass : #MooseQueryResultTest,
	#category : #'Moose-Query-Test'
}

{ #category : #asserting }
MooseIncomingQueryResultTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
MooseIncomingQueryResultTest >> actualClass [
	^ MooseIncomingQueryResult
]
