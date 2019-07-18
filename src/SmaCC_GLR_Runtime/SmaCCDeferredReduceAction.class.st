"
SmaCCDeferredReduceAction represents a deferred message that will be sent once we figure out what we are parsing.

Instance Variables
	arguments	<Array of: Object>	the arguments of the message
	selector	<Symbol>	the selector to send
"
Class {
	#name : #SmaCCDeferredReduceAction,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'reduceEntry'
	],
	#category : #'SmaCC_GLR_Runtime'
}

{ #category : #'instance creation' }
SmaCCDeferredReduceAction class >> entry: anArray arguments: aCollection [
	^ self new
		entry: anArray arguments: aCollection;
		yourself
]

{ #category : #comparing }
SmaCCDeferredReduceAction >> = anObject [
	^ self class = anObject class
		and:
			[ self selector = anObject selector
				and: [ self arguments = anObject arguments ] ]
]

{ #category : #accessing }
SmaCCDeferredReduceAction >> arguments [
	^ arguments
]

{ #category : #'initialize-release' }
SmaCCDeferredReduceAction >> argumentsFor: aSmaCCParser [
	1 to: arguments size do:
		[ :i | 
		arguments
			at: i
			put: ((arguments at: i) performOnSmaCCParser: aSmaCCParser) ].
	^ arguments
]

{ #category : #'initialize-release' }
SmaCCDeferredReduceAction >> entry: anArray arguments: aCollection [
	reduceEntry := anArray.
	arguments := aCollection
]

{ #category : #comparing }
SmaCCDeferredReduceAction >> hash [
	^ self class hash bitXor: (reduceEntry hash bitXor: arguments hash)
]

{ #category : #accessing }
SmaCCDeferredReduceAction >> performOnSmaCCParser: aSmaCCParser [
	| selector |
	selector := self selector.
	^ selector numArgs = 0
		ifTrue: [ aSmaCCParser perform: selector ]
		ifFalse: [ aSmaCCParser
				perform: selector
				with: (self argumentsFor: aSmaCCParser) ]
]

{ #category : #comparing }
SmaCCDeferredReduceAction >> priority [
	^ reduceEntry at: 4 ifAbsent: [ 0 ]
]

{ #category : #accessing }
SmaCCDeferredReduceAction >> selector [
	^ reduceEntry at: 3
]
