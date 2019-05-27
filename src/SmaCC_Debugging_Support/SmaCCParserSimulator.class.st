Class {
	#name : #SmaCCParserSimulator,
	#superclass : #SmaCCGrammarCompiler,
	#instVars : [
		'parserStates',
		'currentParserState',
		'currentToken',
		'scannerSimulator',
		'lastToken',
		'lastState',
		'nextScannerState'
	],
	#category : #'SmaCC_Debugging_Support-Simulation'
}

{ #category : #examples }
SmaCCParserSimulator class >> csharpIfStatement [
	<gtExample>
	| simulator result |
	(Smalltalk includesKey: #CSharpParser)
		ifFalse: [ ^ nil ].
	simulator := SmaCCParserSimulator
		on: #CSharpParser asClass definitionString.
	simulator setupFor: 'if_statement'.
	result := (simulator simulateParse: 'if (a == 2) return 4;') first.
	self assert: result rhs productionSymbol name = 'if_statement'.
	self assert: result items first source = 'if'.
	self assert: result items second source = '('.
	self assert: result items third class = SmaCCReducedItem.
	self assert: result items fourth source = ')'.
	self assert: result items last class = SmaCCReducedItem.
	^ result
]

{ #category : #examples }
SmaCCParserSimulator class >> csharpIncompleteIfStatement [
	<gtExample>
	| simulator |
	(Smalltalk includesKey: #CSharpParser)
		ifFalse: [ ^ nil ].
	simulator := SmaCCParserSimulator
		on: #CSharpParser asClass definitionString.
	simulator setupFor: 'if_statement'.
	[ simulator simulateParse: 'if (a == 2' ]
		on: SmaCCParserSimulationError
		do: [ :ex | 
			self assert: ex isInputIncomplete.
			^ ex ].
	self error: 'Shouldn''t get here'
]

{ #category : #examples }
SmaCCParserSimulator class >> csharpInvalidInput [
	<gtExample>
	| simulator |
	(Smalltalk includesKey: #CSharpParser)
		ifFalse: [ ^ nil ].
	simulator := SmaCCParserSimulator
		on: #CSharpParser asClass definitionString.
	simulator setupFor: 'if_statement'.
	[ simulator simulateParse: 'if (if = 3) return 3;' ]
		on: SmaCCParserSimulationError
		do: [ :ex | 
			self assert: ex token source = 'if'.
			self assert: ex token startPosition = 5.
			^ ex ].
	self error: 'Shouldn''t get here'
]

{ #category : #examples }
SmaCCParserSimulator class >> csharpInvalidToken [
	<gtExample>
	| simulator |
	(Smalltalk includesKey: #CSharpParser)
		ifFalse: [ ^ nil ].
	simulator := SmaCCParserSimulator
		on: #CSharpParser asClass definitionString.
	simulator setupFor: 'if_statement'.
	[ simulator simulateParse: 'if (''' ]
		on: SmaCCParserSimulationError
		do: [ :ex | 
			self assert: ex token isSyntaxError.
			^ ex ].
	self error: 'Shouldn''t get here'
]

{ #category : #examples }
SmaCCParserSimulator class >> javaAmbiguousActions [
	<gtExample>
	| simulator items |
	(Smalltalk includesKey: #JavaParser)
		ifFalse: [ ^ nil ].
	simulator := SmaCCParserSimulator
		on: #JavaParser asClass definitionString.
	simulator setupFor: 'expression'.
	items := simulator simulateParse: 'a(b)'.
	self assert: items size = 1.
	^ items first
]

{ #category : #'instance creation' }
SmaCCParserSimulator class >> on: aString [
	^ self new
		buildDefinition: aString;
		yourself
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> accept [
	currentParserState markAccepted
]

{ #category : #'initialize-release' }
SmaCCParserSimulator >> buildDefinition: aString [
	super buildDefinition: aString.
	scannerSimulator := SmaCCScannerSimulator
		forGrammar: grammar
		nfa: scannerCompiler createFullRegex asNFA
]

{ #category : #'private-item sets' }
SmaCCParserSimulator >> createInitialItemSetFor: smaccSymbol [
	| start |
	startingStateMap := Dictionary new.
	grammar calculateFirstSets.
	start := grammar createStartingSymbolFor: smaccSymbol.
	itemSets := OrderedCollection new.
	itemSets add: (grammar initialItemSetFor: start).
	startingStateMap at: start put: itemSets size.
	shiftTable := Dictionary new
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> currentParserState [
	^ currentParserState
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> duplicateState [
	parserStates
		add:
			(currentParserState := SmaCCParserState
				stateStack: currentParserState stateStack copy
				nodeStack: currentParserState nodeStack copy
				scannerState: currentParserState scannerState copy)
]

{ #category : #private }
SmaCCParserSimulator >> getNextToken [
	currentToken isNil
		ifFalse: [ ^ self ].
	lastState = currentParserState scannerState
		ifTrue: [ currentToken := lastToken.
			scannerSimulator restoreState: nextScannerState.
			currentParserState scannerState: nextScannerState ]
		ifFalse: [ lastState := currentParserState scannerState.
			scannerSimulator restoreState: currentParserState scannerState.
			lastToken := currentToken := scannerSimulator next.
			nextScannerState := scannerSimulator currentState ].
	currentParserState scannerState: nextScannerState
]

{ #category : #parsing }
SmaCCParserSimulator >> isAccepted [
	^ parserStates allSatisfy: [ :each | each isAccepted ]
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> killStateFrom: aSmaCCToken [
	| index |
	index := parserStates identityIndexOf: currentParserState.
	parserStates size > 1
		ifTrue: [ parserStates removeAt: index.
			currentParserState := parserStates
				at: (index min: parserStates size) ]
		ifFalse: [ self signalErrorFrom: aSmaCCToken ]
]

{ #category : #'private-item sets' }
SmaCCParserSimulator >> moveOn: smaccSymbol from: state [
	^ shiftTable
		at: (self shiftTableKeyForIndex: state symbol: smaccSymbol)
		ifAbsentPut: [ self indexOfState: ((itemSets at: state) moveOn: smaccSymbol) ]
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> parserStateId [
	^ currentParserState stateStack last
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> popItems: anInteger [
	| items |
	items := OrderedCollection new: anInteger.
	anInteger
		timesRepeat: [ items addFirst: currentParserState nodeStack removeLast.
			currentParserState stateStack removeLast ].
	^ items
]

{ #category : #private }
SmaCCParserSimulator >> processToken [
	| action state symbol itemSet |
	[ currentToken notNil ]
		whileTrue: [ state := currentParserState stateStack last.
			currentToken ids
				do: [ :id | 
					id > 0
						ifTrue: [ self moveOn: (self symbolForId: id) from: state ] ].
			currentToken isSyntaxError
				ifTrue: [ action := SmaCCRejectAction new ]
				ifFalse: [ symbol := grammar symbols at: currentToken ids first.
					itemSet := itemSets at: state.
					action := itemSet isEmpty
						ifTrue: [ SmaCCRejectAction new ]
						ifFalse:
							[ itemSet action: symbol prefer: (grammar preferredActionFor: symbol) ] ].
			action simulateOn: self token: currentToken ]
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> processedToken [
	currentToken := nil
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> pushObject: anObject andState: anInteger [
	currentParserState stateStack add: anInteger.
	currentParserState nodeStack add: anObject
]

{ #category : #private }
SmaCCParserSimulator >> resetParser [
	lastState := nil.
	currentToken := nil.
	parserStates := OrderedCollection
		with:
			(currentParserState := SmaCCParserState
				stateStack: (OrderedCollection with: 1)
				nodeStack: OrderedCollection new
				scannerState: (SmaCCScannerState position: 0 scope: #default))
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> restoreState: aParserState [
	currentParserState := aParserState.
	scannerSimulator restoreState: currentParserState scannerState
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> restoreState: aParserState andToken: aSmaCCToken [
	currentParserState := aParserState.
	currentToken := aSmaCCToken
]

{ #category : #setup }
SmaCCParserSimulator >> setupFor: productionName [
	self createInitialItemSetFor: (grammar symbolNamed: productionName)
]

{ #category : #'parsing support' }
SmaCCParserSimulator >> signalErrorFrom: aSmaCCToken [
	SmaCCParserSimulationError
		signal: 'Cannot parse input'
		withTag:
			{self.
			aSmaCCToken}
]

{ #category : #parsing }
SmaCCParserSimulator >> simulateParse: aString [
	"Returns all possible interpretations of the parse"

	scannerSimulator on: aString readStream.
	self resetParser.
	[ parserStates size to: 1 by: -1 do: [ :i | 
		self restoreState: (parserStates at: i).
		self getNextToken.
		self processToken ].
	self isAccepted ] whileFalse.
	^ parserStates collect: [ :each | each nodeStack first ]
]

{ #category : #private }
SmaCCParserSimulator >> symbolForId: id [
	^ grammar symbols at: id
]
