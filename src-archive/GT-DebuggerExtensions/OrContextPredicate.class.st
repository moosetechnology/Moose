Class {
	#name : #OrContextPredicate,
	#superclass : #GTDebuggerContextPredicate,
	#instVars : [
		'left',
		'right'
	],
	#category : #'GT-DebuggerExtensions'
}

{ #category : #'instance creation' }
OrContextPredicate class >> with: aPredicate with: anotherPredicate [

	^ self new with: aPredicate with: anotherPredicate
]

{ #category : #testing }
OrContextPredicate >> matchContext: aContext [

	^ (left matches: aContext ) or: [ right matches: aContext ]
]

{ #category : #'instance creation' }
OrContextPredicate >> with: aPredicate with: anotherPredicate [

	left := aPredicate.
	right := anotherPredicate
]
