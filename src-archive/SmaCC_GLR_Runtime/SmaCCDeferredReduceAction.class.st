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
		'selector',
		'arguments'
	],
	#category : #'SmaCC_GLR_Runtime'
}

{ #category : #'instance creation' }
SmaCCDeferredReduceAction class >> selector: aSymbol arguments: aCollection [
	^ self new
		selector: aSymbol arguments: aCollection;
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

{ #category : #comparing }
SmaCCDeferredReduceAction >> hash [
	^ self class hash bitXor: (selector hash bitXor: arguments hash)
]

{ #category : #accessing }
SmaCCDeferredReduceAction >> performOnSmaCCParser: aSmaCCParser [
	^ selector numArgs = 0
		ifTrue: [ aSmaCCParser perform: selector ]
		ifFalse:
			[ aSmaCCParser
				perform: selector
				with: (self argumentsFor: aSmaCCParser) ]
]

{ #category : #accessing }
SmaCCDeferredReduceAction >> selector [
	^ selector
]

{ #category : #'initialize-release' }
SmaCCDeferredReduceAction >> selector: aSymbol arguments: aCollection [
	selector := aSymbol.
	arguments := aCollection
]
