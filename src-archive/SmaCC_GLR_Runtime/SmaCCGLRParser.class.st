"
SmaCCGLRParser is an abstract superclass for all GLR generated parsers in SmaCC.

Instance Variables:
	currentState	<SmaCCParserState>	the current parse that we are trying
	lastPosition	<Integer>	the starting location of the scanner before calling getNextToken
	lastState	<Symbol>	the state of the scanner before calling getNextToken
	lastToken	<SmaCCToken>	the token returned from getNextToken (if the lastState and lastToken are the same as the current token, then this value is returned without scanning anything)
	nextScannerPosition	<Integer>	the ending location of the scanner after calling getNextToken
	nextScannerState	<Symbol>	the ending state of the scanner after calling getNextToken
	parseAll	<Boolean>	should we return a collection of all potential parses or just one
	states	<SequenceableCollection of: SmaCCParserState>	the current list of valid parses
	tryAllStates	<Boolean>	should we try to parse starting from any state instead of the starting state

"
Class {
	#name : #SmaCCGLRParser,
	#superclass : #SmaCCParser,
	#instVars : [
		'states',
		'parseAll',
		'currentState',
		'tryAllStates',
		'lastToken',
		'lastState',
		'nextScannerState'
	],
	#classInstVars : [
		'cachedTrees'
	],
	#category : #'SmaCC_GLR_Runtime'
}

{ #category : #accessing }
SmaCCGLRParser class >> cachedTrees [
	^ cachedTrees ifNil: [ cachedTrees := Dictionary new ]
]

{ #category : #parsing }
SmaCCGLRParser class >> parseAll: aString startingAt: anInteger [
	| parser |
	parser := self on: (ReadStream on: aString).
	parser setStartingState: anInteger.
	parser parseAll: true.
	^ parser parse
]

{ #category : #parsing }
SmaCCGLRParser class >> parseAllPossibleStates: aString [
	"Returns all possible parse nodes that can be created from aString starting from any place in the parser."

	| parser |
	parser := self on: (ReadStream on: aString).
	parser
		parseAll: true;
		setAllStartingStates.
	^ parser parse asSet asOrderedCollection 
]

{ #category : #parsing }
SmaCCGLRParser class >> parseAndCacheAll: aString startingAt: anInteger [
	^ self cachedTrees at: (Array with: aString with: anInteger) ifAbsentPut: [ self parseAll: aString startingAt: anInteger ]
]

{ #category : #parsing }
SmaCCGLRParser class >> parseAndCacheAllPossibleStates: aString [
	^ self cachedTrees at: (Array with: aString with: nil) ifAbsentPut: [ self parseAllPossibleStates: aString ]
]

{ #category : #accessing }
SmaCCGLRParser class >> resetCaches [
	super resetCaches.
	cachedTrees := nil
]

{ #category : #private }
SmaCCGLRParser >> actionsDo: aBlock [
	| row actionBlock |
	actionBlock := [ :action | 
	(self isAmbiguous: action)
		ifTrue: [ | ambiguous |
			ambiguous := OrderedCollection new.
			self ambiguousTransitionsAt: (action bitShift: -2) into: ambiguous.
			ambiguous do: aBlock ]
		ifFalse: [ aBlock value: action ] ].
	row := self transitionTable at: self currentState.
	(row at: 1) == 0
		ifTrue: [ actionBlock value: ((row at: 2) bitShift: 8) + (row at: 3) ]
		ifFalse: [ 2 to: row size by: 4 do: [ :i | actionBlock value: ((row at: i) bitShift: 8) + (row at: i + 1) ] ]
]

{ #category : #private }
SmaCCGLRParser >> actionsForCurrentToken [
	| actions |
	actions := OrderedCollection new: 1.
	self tryAllTokens
		ifTrue: [ currentToken ids
				do: [ :each | self addActionsFor: each to: actions ] ]
		ifFalse: [ self addActionsFor: currentToken ids first to: actions ].
	^ actions
]

{ #category : #private }
SmaCCGLRParser >> addAction: action to: anOrderedCollection [
	(anOrderedCollection includes: action)
		ifTrue: [ ^ self ].
	anOrderedCollection add: action
]

{ #category : #private }
SmaCCGLRParser >> addActionsFor: anInteger to: anOrderedCollection [
	| state |
	state := self currentState.
	self
		addActionsForState: state
		symbol: anInteger
		to: anOrderedCollection
]

{ #category : #private }
SmaCCGLRParser >> addActionsForState: state symbol: anInteger to: anOrderedCollection [
	| action |
	action := self actionForState: state and: anInteger.
	action = self errorAction
		ifTrue: [ ^ self ].
	(self isAmbiguous: action)
		ifTrue: [ self
				ambiguousTransitionsAt: (action bitShift: -2)
				into: anOrderedCollection ]
		ifFalse: [ self addAction: action to: anOrderedCollection ]
]

{ #category : #private }
SmaCCGLRParser >> alwaysPerformReduceAction [
	^ false
]

{ #category : #private }
SmaCCGLRParser >> ambiguousTransitions [
	^ #()
]

{ #category : #private }
SmaCCGLRParser >> ambiguousTransitionsAt: anIndex into: anOrderedCollection [
	| ambiguousTransitions |
	ambiguousTransitions := self ambiguousTransitions at: anIndex.
	1 to: ambiguousTransitions size by: 2 do:
		[ :i | 
		self
			addAction:
				((ambiguousTransitions at: i) bitShift: 8)
					+ (ambiguousTransitions at: i + 1)
			to: anOrderedCollection ]
]

{ #category : #private }
SmaCCGLRParser >> copyStackObject: anObject [
	(anObject isKindOf: String) ifTrue: [^anObject].
	(anObject isKindOf: Collection) ifTrue: [^anObject collect: [:each | self copyStackObject: each]].
	(anObject isKindOf: SmaCCParseNode) ifTrue: [^anObject copy].
	^anObject
]

{ #category : #private }
SmaCCGLRParser >> currentGLRState [
	^ currentState
]

{ #category : #private }
SmaCCGLRParser >> duplicateState [
	| state |
	parseAll ifTrue: [nodeStack := nodeStack collect: [:each | self copyStackObject: each]] ifFalse: [nodeStack := nodeStack copy].
	stateStack := stateStack copy.
	state := currentState copy.
	state stateStack: stateStack nodeStack: nodeStack.
	state scannerState: scanner currentState.
	states add: state.
	^state
]

{ #category : #private }
SmaCCGLRParser >> fixObject: anObject [
	| result |
	result := anObject performOnSmaCCParser: self.
	(result isKindOf: SmaCCParseNode)
		ifTrue: [ result fixParentPointers ].
	^ result
]

{ #category : #private }
SmaCCGLRParser >> getNextToken [
	currentToken isNil
		ifFalse: [ ^ self ].
	lastState = currentState scannerState
		ifTrue: [ currentToken := lastToken.
			scanner restoreState: nextScannerState.
			currentState scannerState: nextScannerState ]
		ifFalse: [ lastState := currentState scannerState.
			scanner restoreState: currentState scannerState.
			lastToken := currentToken := scanner next.
			nextScannerState := scanner currentState ].
	currentState scannerState: nextScannerState
]

{ #category : #private }
SmaCCGLRParser >> initialParserState [
	| state |
	state := SmaCCParserState
		stateStack: stateStack
		nodeStack: nodeStack
		scannerState: scanner currentState.
	^ state
]

{ #category : #'initialize-release' }
SmaCCGLRParser >> initialize [
	super initialize.
	states := OrderedCollection new.
	parseAll := false.
	tryAllStates := false
]

{ #category : #private }
SmaCCGLRParser >> isAmbiguous: action [
	^ (action bitAnd: self actionMask) = 2r11
]

{ #category : #private }
SmaCCGLRParser >> killState [
	states remove: currentState ifAbsent: [  ].
	states isEmpty
		ifTrue: [ self handleError: 0 ].
	(states size = 1 and: [ parseAll not ])
		ifTrue: [ states first runDeferredActionsFor: self ]
]

{ #category : #private }
SmaCCGLRParser >> mergeStates [
	| i j state otherStates otherState |
	i := 1.
	[ i < states size ]
		whileTrue:
			[ state := states at: i.
			otherStates := OrderedCollection new.
			j := i := i + 1.
			[ j <= states size ]
				whileTrue:
					[ otherState := states at: j.
					(parseAll
						ifTrue: [ state = otherState ]
						ifFalse: [ state canBeMergedWith: otherState ])
						ifTrue: [ otherStates add: otherState.
							states removeAt: j ]
						ifFalse: [ j := j + 1 ] ].
			(parseAll not and: [ otherStates notEmpty ])
				ifTrue: [ state mergeWith: otherStates ] ]
]

{ #category : #accessing }
SmaCCGLRParser >> parseAll: aBoolean [
	parseAll := aBoolean
]

{ #category : #private }
SmaCCGLRParser >> performParsingLoop [
	| result |
	self setStartingStatesIfNone.
	[ states size to: 1 by: -1 do:
		[ :i | 
		self restoreState: (states at: i).
		self getNextToken.
		errorToken := nil.
		self performParsingStep ].
	self mergeStates.
	states anySatisfy: [ :each | each isAccepted not ] ] whileTrue.
	self checkForErrors.
	result := parseAll
		ifTrue: [ states
				collect: [ :each | self fixObject: each nodeStack first ] ]
		ifFalse: [ self fixObject: states first nodeStack first ].
	nodeStack := OrderedCollection with: result
]

{ #category : #private }
SmaCCGLRParser >> performParsingStep [
	| actions action |
	currentState isAccepted
		ifTrue: [ ^ self ].
	self restoreState: currentState.
	(tryAllStates and: [ self isEOFToken ])
		ifTrue: [ ^ self processEOFToken ].
	currentToken isPattern
		ifTrue: [ ^ self splitForPatternToken ].
	[ actions := self actionsForCurrentToken.
	actions isEmpty
		ifTrue: [ self killState.
			currentToken := nil.
			^ self ].
	2 to: actions size do: [ :i | self splitWithAction: (actions at: i) ].
	action := actions first.
	action = self acceptAction
		or: [ self performAction: action.
			currentToken isNil ] ] whileFalse.
	action = self acceptAction
		ifTrue: [ currentState markAccepted ]
]

{ #category : #private }
SmaCCGLRParser >> performReduceMethod: aSymbol with: items [
	^ (states size = 1 or: [ parseAll ])
		ifTrue:
			[ 1 to: items size do: [ :i | items at: i put: ((items at: i) performOnSmaCCParser: self) ].
			super performReduceMethod: aSymbol with: items ]
		ifFalse: [ SmaCCDeferredReduceAction
				selector: aSymbol
				arguments: items ]
]

{ #category : #private }
SmaCCGLRParser >> popNodeStack [
	| result |
	result := nodeStack removeLast.
	(self alwaysPerformReduceAction and: [ states size > 1 ])
		ifTrue: [ result := self copyStackObject: result ].
	^ result
]

{ #category : #private }
SmaCCGLRParser >> position: anInteger [
	super position: anInteger.
	currentState scannerState: scanner currentState
]

{ #category : #private }
SmaCCGLRParser >> processEOFToken [
	| originalState performed eofToken |
	currentState isAccepted
		ifTrue: [ ^ self ].
	eofToken := currentToken.
	originalState := currentState.
	performed := Set new.
	self
		reduceActionsDo: [ :each | 
			(performed includes: each)
				ifFalse: [ performed add: each.
					self restoreState: self duplicateState.
					currentToken := eofToken.
					self performAction: each.
					(nodeStack size = 1 and: [ nodeStack first isKindOf: SmaCCParseNode ])
						ifTrue: [ currentState markAccepted ]
						ifFalse: [ self killState ].
					self restoreState: originalState ] ].
	currentToken := eofToken.
	(nodeStack size = 1 and: [ nodeStack first isKindOf: SmaCCParseNode ])
		ifTrue: [ currentState markAccepted ]
		ifFalse: [ self killState ]
]

{ #category : #private }
SmaCCGLRParser >> reduce: anInteger [
	| reduceEntry items size |
	reduceEntry := self reduceTable at: anInteger.
	items := Array new: (size := reduceEntry at: 2).
	nodeStack size < size
		ifTrue: [ self killState.
			^ currentToken := nil ].
	size to: 1 by: -1 do:
		[ :i | 
		items at: i put: self popNodeStack.
		stateStack removeLast ].
	nodeStack
		addLast: (self performReduceMethod: (reduceEntry at: 3) with: items).
	stateStack
		addLast: ((self actionFor: (reduceEntry at: 1)) bitShift: -2)
]

{ #category : #private }
SmaCCGLRParser >> reduceActionsDo: aBlock [
	self
		actionsDo: [ :each | 
			(each bitAnd: self actionMask) = self reduceAction
				ifTrue: [ aBlock value: each ] ]
]

{ #category : #private }
SmaCCGLRParser >> restoreState: aSmaCCParserState [
	currentState := aSmaCCParserState.
	nodeStack := aSmaCCParserState nodeStack.
	stateStack := aSmaCCParserState stateStack.
	scanner restoreState: currentState scannerState
]

{ #category : #private }
SmaCCGLRParser >> scope: aSymbol [
	super scope: aSymbol.
	currentState scannerState: scanner currentState
]

{ #category : #accessing }
SmaCCGLRParser >> setAllStartingStates [
	tryAllStates := true.
	self statesThatShift
		do:
			[ :each | 
			states
				add:
					(SmaCCParserState
						stateStack: (OrderedCollection with: each)
						nodeStack: OrderedCollection new
						scannerState: scanner currentState) ]
]

{ #category : #private }
SmaCCGLRParser >> setStartingStatesIfNone [
	states isEmpty
		ifTrue:
			[ states add: self initialParserState ]
]

{ #category : #private }
SmaCCGLRParser >> splitForPatternToken [
	| token patternNode performedActions nodeClass |
	performedActions := Set new.
	token := currentToken copy.
	token ids: OrderedCollection new.
	patternNode := SmaCCPatternNode onToken: token copy.
	nodeClass := token nodeClassName
		ifNil: [ SmaCCParseNode ]
		ifNotNil: [ :name | self class environment at: name ifAbsent: [ SmaCCParseNode ] ].
	self symbolTypes
		keysAndValuesDo:
			[ :i :each | 
			| actions |
			(i ~= scanner emptySymbolTokenId and: [ i ~= scanner errorTokenId ])
				ifTrue:
					[ actions := OrderedCollection new.
					(each = #SmaCCToken
						or:
							[ each notNil
								and:
									[ (self class environment at: each ifAbsent: [ Object ])
										includesBehavior: nodeClass ] ])
						ifTrue:
							[ self addActionsFor: i to: actions.
							actions
								do:
									[ :action | 
									(performedActions includes: action)
										ifFalse:
											[ performedActions add: action.
											each = #SmaCCToken
												ifTrue:
													[ token ids add: i.
													((action bitAnd: self actionMask) = self reduceAction
														or: [ token isToken ])
														ifTrue: [ currentToken := token.
															self splitWithAction: action ] ]
												ifFalse:
													[ token isNode
														ifTrue:
															[ currentToken := nil.
															self duplicateState.
															stateStack addLast: (action bitShift: -2).
															nodeStack addLast: patternNode.
															self restoreState: currentState ] ] ] ] ] ] ].
	self killState.
	currentToken := nil
]

{ #category : #private }
SmaCCGLRParser >> splitWithAction: anInteger [
	| previousToken previousState |
	previousState := currentState.
	previousToken := currentToken.
	[ currentState := self duplicateState.
	self performAction: anInteger.
	currentToken notNil
		ifTrue: [ self performParsingStep ] ]
		ensure: [ self restoreState: previousState.
			currentToken := previousToken ]
]

{ #category : #private }
SmaCCGLRParser >> states [
	^states
]

{ #category : #private }
SmaCCGLRParser >> statesThatShift [
	^ (1 to: self transitionTable size)
		select:
			[ :each | 
			(1 to: self symbolTypes size)
				anySatisfy:
					[ :i | 
					| actions |
					actions := OrderedCollection new.
					self addActionsForState: each symbol: i to: actions.
					actions
						anySatisfy: [ :action | (action bitAnd: self actionMask) = self shiftAction ] ] ]
]
