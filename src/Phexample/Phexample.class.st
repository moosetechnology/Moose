"
Phexample, because well designed tests expand on one another.

Examples see ForExampleStack. 

by Adrian Kuhn and Niko Schwarz  
"
Class {
	#name : #Phexample,
	#superclass : #TestCase,
	#instVars : [
		'givenNotGiven'
	],
	#category : #'Phexample-Core'
}

{ #category : #accessing }
Phexample class >> allTestSelectors [
	|selectors|
	selectors := self allSelectors copy.
	selectors removeAll: Phexample allSelectors.
	selectors := selectors select: 
		[ :each | self isTest: each ].
	^ selectors union: super allTestSelectors 
]

{ #category : #'selector testing' }
Phexample class >> isTest: aSelector [

	^ (aSelector includesSubstring: 'should' caseSensitive: false) and: [
	    aSelector numArgs isZero].
]

{ #category : #accessing }
Phexample class >> resources [
	^{ Given }
]

{ #category : #accessing }
Phexample class >> shouldInheritSelectors [
	^true
]

{ #category : #comparing }
Phexample >> = example [
	^self class = example class and: [ self selector = example selector ]
]

{ #category : #private }
Phexample >> cleanUpInstanceVariables [
	| names |
	names := self class allInstVarNames asOrderedCollection.
	names removeAll: Phexample allInstVarNames.
	names do: [ :name | self instVarNamed: name put: nil ]
]

{ #category : #private }
Phexample >> expectedFailures [
	| pragmas |
	pragmas := Pragma allNamed: #expectedFailure from: self class to: Object.
	^ pragmas collect: [:each | each method selector  ].
]

{ #category : #dependencies }
Phexample >> given: anExampleName [ 
	self should respondTo: anExampleName.
	(thisContext sender method selector = anExampleName) should be: false.
	^ [ Given current consumeReturnValueAt: (self class selector: anExampleName) ] 
		on:  TestResult failure , TestResult error
		do: [ :ex | 
			givenNotGiven := true.
			ex pass ]
]

{ #category : #comparing }
Phexample >> hash [
	^self class hash bitXor: self selector hash
]

{ #category : #private }
Phexample >> performTest [
	^Given current produceReturnValueAt: self. 
]

{ #category : #private }
Phexample >> shouldPass [
	^ super shouldPass and: [ (givenNotGiven = true) not ]
]
