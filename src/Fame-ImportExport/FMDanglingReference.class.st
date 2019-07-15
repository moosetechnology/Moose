Class {
	#name : #FMDanglingReference,
	#superclass : #Object,
	#instVars : [
		'to',
		'owner',
		'pos'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #'instance creation' }
FMDanglingReference class >> with: aFutureAttribute [ 
	
	^self new initialize: aFutureAttribute 
]

{ #category : #'initialize-release' }
FMDanglingReference >> initialize: aFutureAttribute [ 
	
	owner := aFutureAttribute.
	owner count: owner count + 1.
	pos := owner values size + 1.
]

{ #category : #parsing }
FMDanglingReference >> resolve: element [
	element notNil should beTrue.
	owner values at: pos put: element.
	owner count: owner count - 1.
	owner maybeEnd
]
