"
A MooseQueryResultTest is a test class for testing the behavior of MooseQueryResult
"
Class {
	#name : #MooseQueryResultTest,
	#superclass : #TestCase,
	#category : #'Moose-Query-Test'
}

{ #category : #testing }
MooseQueryResultTest class >> isAbstract [
	^ self = MooseQueryResultTest
]

{ #category : #helper }
MooseQueryResultTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helper }
MooseQueryResultTest >> newSimpleInstance [
	^ self actualClass
		on:
			(FamixJavaMethod new
				signature: 'A';
				name: 'A';
				yourself)
		withAll: #(1 2 3)
]

{ #category : #tests }
MooseQueryResultTest >> testCollect [
	| group result |
	group := self newSimpleInstance.
	result := group collect: [ :e | e + 1 ].
	self assert: (result includesAll: {2 . 3 . 4}).
	self assert: result receiver equals: group receiver.
	self deny: group == result
]

{ #category : #tests }
MooseQueryResultTest >> testEquality [
	| result1 result2 |
	result1 := self newSimpleInstance.
	result2 := self newSimpleInstance.
	self assert: result1 equals: result1.
	self assert: result1 equals: result2
]

{ #category : #tests }
MooseQueryResultTest >> testReject [
	| group result |
	group := self newSimpleInstance.
	result := group reject: #odd.
	self assert: (result includes: 2).
	self deny: (result includesAll: {1 . 3}).
	self assert: result receiver equals: group receiver.
	self deny: group == result
]

{ #category : #tests }
MooseQueryResultTest >> testSelect [
	| group result |
	group := self newSimpleInstance.
	result := group select: #even.
	self assert: (result includes: 2).
	self deny: (result includesAll: {1 . 3}).
	self assert: result receiver equals: group receiver.
	self deny: group == result
]
