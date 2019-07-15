Class {
	#name : #SmaCCParserDebugger,
	#superclass : #GTGenericStackDebugger,
	#instVars : [
		'isGLR'
	],
	#classInstVars : [
		'availableAutomatically'
	],
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #accessing }
SmaCCParserDebugger class >> availableAutomatically [
	^ availableAutomatically ifNil: [ false ]
]

{ #category : #accessing }
SmaCCParserDebugger class >> availableAutomatically: aBoolean [
	availableAutomatically := aBoolean
]

{ #category : #accessing }
SmaCCParserDebugger class >> defaultTitle [
	^ 'SmaCCParser'
]

{ #category : #testing }
SmaCCParserDebugger class >> handlesContext: aContext [
	^ (aContext findContextSuchThat: [ :each | self isParseContext: each ]) notNil
]

{ #category : #'class initialization' }
SmaCCParserDebugger class >> initialize [
	self register
]

{ #category : #testing }
SmaCCParserDebugger class >> isParseContext: each [
	^ each selector = #parse and: [ each receiver isKindOf: SmaCCParser ]
]

{ #category : #'instance creation' }
SmaCCParserDebugger class >> on: aDebugSession [
	| glrClass |
	glrClass := Smalltalk at: #SmaCCGLRParser ifAbsent: [ self ].
	^ self basicNew
		isGLR: (aDebugSession parser isKindOf: glrClass);
		initialize;
		session: aDebugSession
]

{ #category : #'tools registry' }
SmaCCParserDebugger class >> register [
	self registerToolsOn: Smalltalk tools
]

{ #category : #'tools registry' }
SmaCCParserDebugger class >> registerToolsOn: aRegistry [
	aRegistry registerDebugger: self withRank: 60
]

{ #category : #accessing }
SmaCCParserDebugger class >> sessionClass [
	^ SmaCCParserDebugSession
]

{ #category : #building }
SmaCCParserDebugger >> actionLabelFor: anInteger [
	| type parser |
	parser := self parser.
	type := anInteger bitAnd: parser actionMask.
	type = parser acceptAction
		ifTrue: [ ^ 'Accept' ].
	type = parser shiftAction
		ifTrue: [ ^ 'Shift' ].
	type = parser reduceAction
		ifTrue: [ ^ self reduceActionName: (anInteger bitShift: -2) ].
	^ 'Multiple'
]

{ #category : #building }
SmaCCParserDebugger >> buildGLRTransmissionsIn: browser [
	self isGLR
		ifTrue:
			[ browser transmit
				from: #stack port: #selection;
				to: #glrStates;
				transformed: [ :context | self glrParserStates ];
				andShow:
						[ :composite | 
					composite table
						title: 'GLR';
						format:
								[ :each | (self session parser states identityIndexOf: each) printString ] ] ]
]

{ #category : #building }
SmaCCParserDebugger >> buildInputIn: browser [
	browser transmit
		fromOutsideEntityPort;
		to: #input;
		andShowIfNone: [ :composite | 
			| text |
			text := composite text.
			text
				title: 'Input';
				display: [ self inputText ];
				withLineNumbers: true.
			text with: [ :c | self installActionsForRootPragmas: #(#SmaCCDebuggingInputAction) in: c ] ].
	browser transmit
		from: #stack port: #selection;
		to: #input port: #selectionInterval;
		transformed: [ :each | self inputSelectionInterval ].
	browser transmit
		from: #stackState port: #selection;
		to: #input port: #selectionInterval;
		transformed: [ :each | 
			each notNil
				ifTrue: [ (self tokenIntervalFor: each last) ifNil: [ self inputSelectionInterval ] ] ]
]

{ #category : #building }
SmaCCParserDebugger >> buildPotentialTokensIn: browser [
	browser transmit
		from: #stack port: #selection;
		to: #potential;
		transformed: [ :context | self potentialStateActions ];
		andShow: [ :composite | 
			composite table
				title: 'Possible Actions';
				column: 'Symbol' evaluated: [ :each | each first ];
				column: 'Action' evaluated: [ :each | each last ] ]
]

{ #category : #building }
SmaCCParserDebugger >> buildScannerStateIn: browser [
	browser transmit
		from: #stack port: #selection;
		to: #scannerState;
		transformed: [ :context | self scannerProperties ];
		andShow:
				[ :composite | 
			composite table
				title: 'Scanner';
				column: 'Name' evaluated: [ :each | each first ];
				column: 'Value' evaluated: [ :each | each last ];
				with: [ :c | self installActionsForRootPragmas: #(#SmaCCDebuggingScannerAction) in: c ] ]
]

{ #category : #building }
SmaCCParserDebugger >> buildStackStateIn: browser [
	browser transmit
		from: #stack port: #selection;
		to: #stackState;
		transformed: [ :context | self parserStack ];
		andShow: [ :composite | 
			composite table
				title: 'Parser Stack';
				column: 'Symbol' evaluated: [ :each | each first ];
				column: 'Value' evaluated: [ :each | each last ];
				morphicSelectionAct: [ :list | list selection last inspect ]
					icon: GLMUIThemeExtraIcons glamorousInspect
					on: $i
					entitled: 'Inspect';
				with: [ :c | self installActionsForRootPragmas: #(#SmaCCDebuggingParserAction) in: c ] ]
]

{ #category : #private }
SmaCCParserDebugger >> currentInputSelectionInterval [
	^ self selectionIntervalForPane: #input
]

{ #category : #building }
SmaCCParserDebugger >> debuggerStructureIn: browser [
	browser
		row: [ :row | 
			row
				column: #stackState span: 6;
				column: #potential span: 6.
			self isGLR
				ifTrue: [ row column: #glrStates ] ].
	browser
		row: [ :row | 
			row
				column: #input span: 2;
				column: #scannerState ];
		row: [ :row | 
			row
				column: #stack;
				column: #code ];
		row: #inspector span: 0
]

{ #category : #building }
SmaCCParserDebugger >> debuggerTransmissionsIn: browser [
	super debuggerTransmissionsIn: browser.
	self buildGLRTransmissionsIn: browser.
	self buildStackStateIn: browser.
	self buildPotentialTokensIn: browser.
	self buildScannerStateIn: browser.
	self buildInputIn: browser
]

{ #category : #private }
SmaCCParserDebugger >> glrParserStates [
	| states |
	states := self parser states.
	^ states isEmpty
		ifTrue: [ Array with: self parser currentGLRState ]
		ifFalse: [ states ]
]

{ #category : #private }
SmaCCParserDebugger >> inputSelectionInterval [
	| context receiver |
	context := self session context findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCScanner) or: [ each receiver isKindOf: SmaCCParser ] ].
	context isNil
		ifTrue: [ ^ 1 to: 0 ].
	receiver := context receiver.
	^ (receiver isKindOf: SmaCCParser)
		ifTrue: [ (receiver currentToken isNil or: [ receiver currentToken startPosition isNil ])
				ifTrue: [ self scanner position + 1 to: self scanner position ]
				ifFalse: [ receiver currentToken startPosition to: receiver currentToken stopPosition ] ]
		ifFalse: [ self scanner debugStart + 1 to: self scanner position ]
]

{ #category : #private }
SmaCCParserDebugger >> inputText [
	^ self parser scanner debugSource
]

{ #category : #accessing }
SmaCCParserDebugger >> isGLR [

	^ isGLR ifNil: [ false ]
]

{ #category : #accessing }
SmaCCParserDebugger >> isGLR: aBoolean [
	isGLR := aBoolean
]

{ #category : #private }
SmaCCParserDebugger >> parser [
	^ self session parser
]

{ #category : #private }
SmaCCParserDebugger >> parserStack [
	| states nodes items context reduceContext |
	states := self parser stateStack.
	nodes := self parser nodeStack.
	items := OrderedCollection new.
	1 to: states size - 1 do: [ :i | items addFirst: (Array with: (self symbolForTransitionFrom: (states at: i) to: (states at: i + 1)) with: (nodes at: i)) ].
	context := self session context
		findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #performReduceMethod:with: ] ].
	context notNil
		ifTrue: [ items add: #('' '').
			reduceContext := context findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #reduce: ] ].
			items addFirst: #('' '').
			(context tempAt: 2) size to: 1 by: -1 do: [ :i | items addFirst: (Array with: 'nodes at: ' , i printString with: ((context tempAt: 2) at: i)) ].
			items addFirst: (Array with: 'Reducing:' with: (self parser symbolNameFor: (reduceContext receiver reduceTable at: (reduceContext tempAt: 1)) first)) ].
	self parser currentToken
		ifNotNil: [ :token | 
			| stream |
			stream := WriteStream on: String new.
			token ids do: [ :each | stream nextPutAll: (self parser symbolNameFor: each) ] separatedBy: [ stream nextPut: $; ].
			items
				addFirst: #('' '');
				addFirst: (Array with: stream contents with: token);
				addFirst: (Array with: 'Lookahead:' with: '') ].
	^ items
]

{ #category : #building }
SmaCCParserDebugger >> potentialStateActions [
	| items ids |
	items := OrderedCollection new.
	self parser
		actionsAndSymbolsForState: self parser stateStack last
		do: [ :action :symbol | items add: (Array with: (self parser symbolNameFor: symbol) with: symbol with: (self actionLabelFor: action)) ].
	ids := self parser currentToken ifNotNil: [ :token | token ids ] ifNil: [ #() ].
	items := items
		asSortedCollection: [ :a :b | 
			| aIncluded |
			(aIncluded := ids includes: (a at: 2)) = (ids includes: (b at: 2))
				ifTrue: [ (a at: 2) < (b at: 2) ]
				ifFalse: [ aIncluded ] ].
	ids notEmpty
		ifTrue: [ items
				do: [ :each | 
					(ids includes: (each at: 2))
						ifTrue: [ each at: 1 put: each first asText allBold.
							each at: 3 put: each last asText allBold ]
						ifFalse: [ each at: 1 put: (each first asText makeAllColor: Color red).
							each at: 3 put: (each last asText makeAllColor: Color red) ] ] ].
	^ items
]

{ #category : #building }
SmaCCParserDebugger >> reduceActionName: anInteger [
	| entry |
	entry := self parser reduceTable at: anInteger.
	^ 'Reduce(' , (entry at: 2) printString , ') as ' , (self parser symbolNameFor: entry first)
]

{ #category : #private }
SmaCCParserDebugger >> scanner [
	^ self parser scanner
]

{ #category : #building }
SmaCCParserDebugger >> scannerProperties [
	| items scanner string |
	scanner := self scanner.
	items := OrderedCollection new.
	string := scanner outputStream ifNil: [ '' ] ifNotNil: [ :stream | stream contents ].
	items add: (Array with: 'Scope' with: scanner scope).
	(self currentContext receiver isKindOf: SmaCCScanner)
		ifTrue: [ items
				add: (Array with: 'Current Character' with: scanner currentCharacter);
				add: (Array with: 'Start Index' with: scanner debugStart).
			string isEmpty
				ifFalse: [ items
						add: (Array with: 'Scan String' with: string);
						add: (Array with: 'Match String' with: (string copyFrom: 1 to: scanner lastOutputStreamMatchPosition));
						add:
							(Array
								with: 'Match Type'
								with:
									(scanner matchActions
										ifNil: [ '' ]
										ifNotNil: [ :symbols | 
											| stream |
											stream := WriteStream on: String new.
											symbols do: [ :each | stream nextPutAll: (self parser symbolNameFor: each) ] separatedBy: [ stream space ].
											stream contents ])) ] ].
	^ items
]

{ #category : #private }
SmaCCParserDebugger >> symbolForTransitionFrom: fromState to: toState [
	| id |
	id := self parser symbolIdForTransitionFrom: fromState to: toState.
	^ self parser symbolNameFor: id
]

{ #category : #building }
SmaCCParserDebugger >> tokenIntervalFor: anObject [
	(anObject isKindOf: OrderedCollection)
		ifTrue: [ | interval |
			anObject
				do: [ :each | 
					| newInterval |
					newInterval := self tokenIntervalFor: each.
					interval isNil
						ifTrue: [ interval := newInterval ]
						ifFalse: [ newInterval notNil
								ifTrue: [ interval := (interval first min: newInterval first) to: (interval last max: newInterval last) ] ] ].
			^ interval ].
	(anObject isKindOf: SmaCCToken)
		ifTrue: [ (anObject startPosition notNil and: [ anObject startPosition > 0 ])
				ifTrue: [ ^ anObject startPosition to: anObject stopPosition ] ].
	(anObject isKindOf: SmaCCParseNode)
		ifTrue: [ | start end tokens |
			start := SmallInteger maxVal.
			end := 0.
			tokens := OrderedCollection new.
			anObject allTokensInto: tokens.
			tokens
				do: [ :each | 
					(each startPosition notNil and: [ each startPosition > 0 ])
						ifTrue: [ start := start min: each startPosition.
							end := end max: each stopPosition ] ].
			start <= end
				ifTrue: [ ^ start to: end ] ].
	^ nil
]
