"
SmaCCParserState represents a particular parse in a GLR parser.

Instance Variables:
	isAccepted	<Boolean>	has this parse been accepted
	nodeStack	<SequenceableCollection of: Object>	the stack of objects for this parse
	position	<Integer>	the current position of the scanner
	scannerState	<Symbol> the current state of the scanner
	stateStack	<SequenceableCollection of: Integer>	the stack of states for this parse


"
Class {
	#name : #SmaCCParserState,
	#superclass : #Object,
	#instVars : [
		'stateStack',
		'nodeStack',
		'isAccepted',
		'scannerState',
		'attributes'
	],
	#category : #'SmaCC_GLR_Runtime'
}

{ #category : #'instance creation' }
SmaCCParserState class >> stateStack: stateStack nodeStack: nodeStack [
	^ self new
		stateStack: stateStack nodeStack: nodeStack;
		yourself
]

{ #category : #'instance creation' }
SmaCCParserState class >> stateStack: stateStack nodeStack: nodeStack scannerState: aSmaCCScannerState [
	^ self new
		stateStack: stateStack nodeStack: nodeStack;
		scannerState: aSmaCCScannerState;
		yourself
]

{ #category : #comparing }
SmaCCParserState >> = anObject [
	^ self == anObject
		or:
			[ self class = anObject class
				and:
					[ self stateStack = anObject stateStack
						and: [ self nodeStack = anObject nodeStack ] ] ]
]

{ #category : #accessing }
SmaCCParserState >> attributeNamed: aSymbol [
	^attributes ifNil: [ nil ] ifNotNil: [ attributes at: aSymbol ]
]

{ #category : #accessing }
SmaCCParserState >> attributeNamed: aSymbol put: aValue [
	(attributes ifNil: [ attributes := Dictionary new ]) at: aSymbol put: aValue
]

{ #category : #testing }
SmaCCParserState >> canBeMergedWith: aSmaCCParserState [
	^ self stateStack = aSmaCCParserState stateStack and: [ self scannerState = aSmaCCParserState scannerState ]
]

{ #category : #comparing }
SmaCCParserState >> hash [
	^ self stateStack hash
]

{ #category : #testing }
SmaCCParserState >> isAccepted [
	^ isAccepted
]

{ #category : #accessing }
SmaCCParserState >> markAccepted [
	isAccepted := true
]

{ #category : #accessing }
SmaCCParserState >> mergeWith: aSmaCCParserStateCollection [
	| stacks |
	stacks := OrderedCollection new: aSmaCCParserStateCollection size + 1.
	stacks add: nodeStack.
	aSmaCCParserStateCollection
		do:
			[ :each | 
			(stacks includes: each nodeStack)
				ifFalse: [ stacks add: each nodeStack ] ].
	nodeStack := SmaCCDeferredChoice mergeStacks: stacks
]

{ #category : #accessing }
SmaCCParserState >> nodeStack [
	^ nodeStack
]

{ #category : #copying }
SmaCCParserState >> postCopy [
	super postCopy.
	attributes notNil
		ifTrue: [ attributes := attributes copy ]
]

{ #category : #accessing }
SmaCCParserState >> runDeferredActionsFor: aSmaCCParser [
	1 to: nodeStack size do:
		[ :i | 
		| each |
		each := nodeStack at: i.
		nodeStack at: i put: (each performOnSmaCCParser: aSmaCCParser) ]
]

{ #category : #accessing }
SmaCCParserState >> scannerState [
	^ scannerState
]

{ #category : #accessing }
SmaCCParserState >> scannerState: anObject [
	scannerState := anObject
]

{ #category : #accessing }
SmaCCParserState >> stateStack [
	^ stateStack
]

{ #category : #'initialize-release' }
SmaCCParserState >> stateStack: stateCollection nodeStack: nodeCollection [
	stateStack := stateCollection.
	nodeStack := nodeCollection.
	isAccepted := false
]
