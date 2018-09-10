"
This class stores an object to be converted to a node test and one or more predicates to apply with it.
"
Class {
	#name : #XPathNodeTestWithPredicates,
	#superclass : #Object,
	#instVars : [
		'nodeTest',
		'predicates'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathNodeTestWithPredicates class >> nodeTest: aNodeTest predicates: aPredicateOrPredicateCollection [
	^ self new
		setNodeTest: aNodeTest
		predicates: aPredicateOrPredicateCollection
]

{ #category : #copying }
XPathNodeTestWithPredicates >> ?? aPredicateOrPredicateCollection [
	^ self copy setPredicates:
		(aPredicateOrPredicateCollection isCollection
			ifTrue: [predicates, aPredicateOrPredicateCollection]
			ifFalse: [predicates copyWith: aPredicateOrPredicateCollection])
]

{ #category : #testing }
XPathNodeTestWithPredicates >> isXPathNodeTestWithPredicates [
	^ true
]

{ #category : #accessing }
XPathNodeTestWithPredicates >> nodeTest [
	^ nodeTest
]

{ #category : #accessing }
XPathNodeTestWithPredicates >> predicates [
	^ predicates
]

{ #category : #printing }
XPathNodeTestWithPredicates >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self nodeTest;
		nextPutAll: '; ';
		print: self predicates;
		nextPut: $).
]

{ #category : #initialization }
XPathNodeTestWithPredicates >> setNodeTest: aNodeTest predicates: aPredicateOrPredicateCollection [
	nodeTest := aNodeTest.
	self setPredicates: aPredicateOrPredicateCollection.
]

{ #category : #initialization }
XPathNodeTestWithPredicates >> setPredicates: aPredicateOrPredicateCollection [
	predicates :=
		aPredicateOrPredicateCollection isArray
			ifTrue: [aPredicateOrPredicateCollection]
			ifFalse: [
				aPredicateOrPredicateCollection isCollection
					ifTrue: [
						"avoid #newFrom: for portability"
						Array withAll: aPredicateOrPredicateCollection]
					ifFalse: [Array with: aPredicateOrPredicateCollection]]
]
