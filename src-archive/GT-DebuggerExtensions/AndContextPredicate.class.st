Class {
	#name : #AndContextPredicate,
	#superclass : #GTDebuggerContextPredicate,
	#instVars : [
		'left',
		'right'
	],
	#category : #'GT-DebuggerExtensions'
}

{ #category : #'instance creation' }
AndContextPredicate class >> with: aPredicate with: anotherPredicate [

	^ self new with: aPredicate with: anotherPredicate
]

{ #category : #testing }
AndContextPredicate >> matchContext: aContext [

	^ (left matches: aContext ) and: [ right matches: aContext ]
]

{ #category : #'instance creation' }
AndContextPredicate >> with: aPredicate with: anotherPredicate [

	left := aPredicate.
	right := anotherPredicate
]
