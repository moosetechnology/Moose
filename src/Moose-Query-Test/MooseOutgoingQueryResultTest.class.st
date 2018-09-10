Class {
	#name : #MooseOutgoingQueryResultTest,
	#superclass : #MooseQueryResultTest,
	#category : #'Moose-Query-Test'
}

{ #category : #asserting }
MooseOutgoingQueryResultTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
MooseOutgoingQueryResultTest >> actualClass [
	^ MooseOutgoingQueryResult
]
