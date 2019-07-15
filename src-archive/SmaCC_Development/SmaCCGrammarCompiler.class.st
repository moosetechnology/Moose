Class {
	#name : #SmaCCGrammarCompiler,
	#superclass : #Object,
	#instVars : [
		'shiftTable',
		'itemSets',
		'startingStateMap',
		'actions',
		'parserDefinitionString',
		'scannerCompiler',
		'grammar',
		'codeGenerator',
		'reduceTable'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'action table' }
SmaCCGrammarCompiler >> actionForState: anInteger on: aSmaCCSymbol [
	| action |
	action := (itemSets at: anInteger)
		action: aSmaCCSymbol
		prefer: (grammar preferredActionFor: aSmaCCSymbol).
	^ self idForAction: action state: anInteger on: aSmaCCSymbol
]

{ #category : #'initialize-release' }
SmaCCGrammarCompiler >> buildDefinition: definitionString [
	| parser tree |
	scannerCompiler grammar: self grammar.
	parserDefinitionString := definitionString.
	parser := SmaCCDefinitionParser on: (ReadStream on: definitionString).
	parser scanner parseSourceSelector: self codeGenerator parseSourceSelector.
	tree := parser parse.
	tree completeSource: definitionString.
	SmaCCGrammarCreator buildGrammar: grammar from: tree.
	grammar finishBuilding
]

{ #category : #private }
SmaCCGrammarCompiler >> checkFor: problemSymbols errorMessage: errorMessage [
	| stream |
	problemSymbols isEmpty
		ifTrue: [ ^ self ].
	stream := WriteStream with: String new.
	problemSymbols
		do: [ :each | stream nextPutAll: each printString ]
		separatedBy: [ stream space ].
	SmaCCCompilationNotification new
		messageText: errorMessage;
		tag: stream contents;
		signal
]

{ #category : #private }
SmaCCGrammarCompiler >> checkForEmptySymbols [
	self
		checkFor: grammar emptySymbols
		errorMessage: 'Missing non-terminal productions'
]

{ #category : #private }
SmaCCGrammarCompiler >> checkForUnusedSymbols [
	self
		checkFor: grammar unusedSymbols
		errorMessage: 'Unused non-terminal symbols'
]

{ #category : #accessing }
SmaCCGrammarCompiler >> codeGenerator [
	^ codeGenerator
		ifNil: [ self codeGenerator: SmaCCSmalltalkCodeGenerator new ]
]

{ #category : #'initialize-release' }
SmaCCGrammarCompiler >> codeGenerator: aSmaCCCodeGenerator [
	codeGenerator := aSmaCCCodeGenerator.
	self grammar codeGenerator: aSmaCCCodeGenerator.
	scannerCompiler codeGenerator: aSmaCCCodeGenerator.
	^ codeGenerator
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileInto: sClass andParser: pClass [
	self scannerClass: sClass.
	self parserClass: pClass.
	self createChanges.
	self codeGenerator compileChanges
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileNodeClasses [
	SmaCCNodeCalculation compileForGrammar: grammar
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileParser [
	self compileNodeClasses.
	self codeGenerator
		compileTransitionTable: self transitionTable;
		compileStartingStateIds: startingStateMap;
		compileReductionTable: self reduceTable;
		compileReductionActions;
		compileScannerClassIntoParser;
		compileSymbolNames;
		compileCacheId
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileScanner [
	scannerCompiler compileScanner
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> compressTable: table [
	^ table collect: [ :row | self compressTableRow: row ]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> compressTableRow: row [
	| uniqueItems |
	uniqueItems := self uniqueNonErrorActionsForTableRow: row.
	^ uniqueItems size = 1
		ifTrue: [ self
				singleActionTableRow: row
				forAction: uniqueItems first ]
		ifFalse: [ self multipleActionTableRow: row ]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> compressedRowStream [
	^ WriteStream with: Array new
]

{ #category : #compiling }
SmaCCGrammarCompiler >> createChanges [
	self codeGenerator removeOldMethods.
	self checkForEmptySymbols.
	self checkForUnusedSymbols.
	self compileScanner.
	self compileParser.
	self codeGenerator compileDefinitionComment: parserDefinitionString
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> createItemSets [
	| itemSet newState index |
	startingStateMap := Dictionary new.
	grammar calculateFirstSets.
	itemSets := OrderedCollection new.
	grammar allStartingSymbols
		do:
			[ :each | 
			itemSets add: (grammar initialItemSetFor: each).
			startingStateMap at: each put: itemSets size ].
	shiftTable := Dictionary new.
	index := 1.
	[ index <= itemSets size ]
		whileTrue:
			[ itemSet := itemSets at: index.
			grammar symbols
				do:
					[ :each | 
					newState := itemSet moveOn: each.
					newState notEmpty
						ifTrue:
							[ shiftTable
								at: (self shiftTableKeyForIndex: index symbol: each)
								put: (self indexOfState: newState) ] ].
			index := index + 1 ]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> createTransitionTable [
	| table optimizedTable |
	table := (1 to: itemSets size) collect: [ :index | scannerCompiler symbols collect: [ :each | self actionForState: index on: each ] ].
	optimizedTable := self optimizeTransitionTable: table.
	actions := self compressTable: optimizedTable
]

{ #category : #accessing }
SmaCCGrammarCompiler >> grammar [
	^ grammar isNil
		ifTrue: [ grammar := SmaCCGrammar new ]
		ifFalse: [ grammar ]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> idForAction: aSmaCCAction state: anInteger on: aSmaCCSymbol [
	| index preferredAction newStateIndex |
	(aSmaCCAction isAmbiguous and: [ grammar isGLR ])
		ifTrue:
			[ index := codeGenerator
				ambiguousTableEntryFor:
					(aSmaCCAction actions
						collect:
							[ :each | self idForAction: each state: anInteger on: aSmaCCSymbol ])
						asSet asSortedCollection.
			^ (index bitShift: 2) + 3 ]
		ifFalse:
			[ preferredAction := aSmaCCAction preferredAction.
			preferredAction isShift
				ifTrue:
					[ newStateIndex := shiftTable
						at: (self shiftTableKeyForIndex: anInteger symbol: aSmaCCSymbol).
					^ (newStateIndex bitShift: 2) + preferredAction id ].
			preferredAction isReduce
				ifTrue:
					[ ^ ((self reduceTableIndexFor: preferredAction) bitShift: 2)
						+ preferredAction id ].
			^ aSmaCCAction id ]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> indexOfState: newState [
	| newStateIndex |
	newStateIndex := itemSets indexOf: newState.
	newStateIndex = 0
		ifTrue: [ itemSets add: newState.
			newStateIndex := itemSets size ]
		ifFalse: [ (itemSets at: newStateIndex) mergeWith: newState ].
	^ newStateIndex
]

{ #category : #'initialize-release' }
SmaCCGrammarCompiler >> initialize [
	super initialize.
	scannerCompiler := SmaCCScannerCompiler new.
	startingStateMap := Dictionary new.
	reduceTable := OrderedCollection new
]

{ #category : #accessing }
SmaCCGrammarCompiler >> itemSetsComment [
	| stream |
	stream := WriteStream on: String new.
	itemSets
		keysAndValuesDo:
			[ :index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: each printString;
				cr ].
	^ stream contents
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> multipleActionTableRow: row [
	| stream |
	stream := self compressedRowStream.
	stream nextPut: 1.
	row
		keysAndValuesDo:
			[ :index :each | 
			each ~= 3
				ifTrue:
					[ self writeInteger: each on: stream.
					self writeInteger: index on: stream ] ].
	^ stream contents
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> optimizeTransitionTable: anArray [
	^ anArray
		collect: [ :row | 
			row
				collect: [ :action | 
					| newShiftAction |
					(action bitAnd: 2r11) = SmaCCShiftAction id
						ifTrue: [ newShiftAction := self optimizedShiftFrom: row to: (action bitShift: -2) inTable: anArray ].
					newShiftAction notNil
						ifTrue: [ newShiftAction ]
						ifFalse: [ action ] ] ]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> optimizedShiftFrom: row to: stateIndex inTable: anArray [
	| items action reduceEntry otherAction |
	items := (anArray at: stateIndex) asSet.
	items remove: SmaCCRejectAction id ifAbsent: [  ].
	items size ~= 1
		ifTrue: [ ^ nil ].
	action := items asArray first.
	(action bitAnd: 2r11) = SmaCCReduceAction id
		ifFalse: [ ^ nil ].
	reduceEntry := reduceTable at: (action bitShift: -2).
	reduceEntry last = #liftFirstValue:
		ifFalse: [ ^ nil ].
	(reduceEntry at: 2) = 1
		ifFalse: [ ^ nil ].
	otherAction := row at: reduceEntry first.
	^ (self optimizedShiftFrom: row to: (otherAction bitShift: -2) inTable: anArray) ifNil: [ otherAction ]
]

{ #category : #accessing }
SmaCCGrammarCompiler >> parserClass [
	^ self codeGenerator parserClass
]

{ #category : #accessing }
SmaCCGrammarCompiler >> parserClass: aClassOrString [
	grammar isGLR
		ifTrue: [ self codeGenerator glrParserClass: aClassOrString ]
		ifFalse: [ self codeGenerator parserClass: aClassOrString ]
]

{ #category : #'reduction table' }
SmaCCGrammarCompiler >> reduceTable [
	^ reduceTable
]

{ #category : #'reduction table' }
SmaCCGrammarCompiler >> reduceTableIndexFor: aSmaCCReduceAction [
	| value |
	value := Array
		with: (scannerCompiler symbols indexOf: aSmaCCReduceAction symbol)
		with: aSmaCCReduceAction rhs size
		with: (self codeGenerator compileSourceFor: aSmaCCReduceAction).
	^ reduceTable
		indexOf: value
		ifAbsent: [ reduceTable
				add: value;
				size ]
]

{ #category : #accessing }
SmaCCGrammarCompiler >> scannerClass: aClassOrString [
	self codeGenerator scannerClass: aClassOrString
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> shiftTableKeyForIndex: anInteger symbol: aSmaCCSymbol [
	^ SmaCCSymbolTableIndex forIndex: anInteger symbol: aSmaCCSymbol
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> singleActionTableRow: row forAction: anInteger [
	| stream |
	stream := self compressedRowStream.
	stream nextPut: 0.
	self writeInteger: anInteger on: stream.
	row
		keysAndValuesDo:
			[ :index :each | 
			each ~= 3
				ifTrue: [ self writeInteger: index on: stream ] ].
	^ stream contents
]

{ #category : #accessing }
SmaCCGrammarCompiler >> symbolsComment [
	| stream |
	stream := WriteStream on: String new.
	scannerCompiler symbols
		keysAndValuesDo:
			[ :index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: '. ';
				nextPutAll: each printString;
				cr ].
	^ stream contents
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> transitionTable [
	actions isNil
		ifTrue: [ self createItemSets.
			self createTransitionTable ].
	^ actions
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> uniqueNonErrorActionsForTableRow: row [
	^ row asSet
		remove: 3 ifAbsent: [  ];
		asArray
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> writeInteger: anInteger on: aStream [
	aStream nextPut: anInteger
]
