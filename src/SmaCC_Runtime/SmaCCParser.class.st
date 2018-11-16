"
SmaCCParser is an abstract class that defines most of the parsing actions. Subclasses will define methods that specify their transitions and reduction actions. These are normally defined automatically when compiling the parser.

Subclasses must implement the following messages:
	accessing
		reduceTable
		transitionTable

Instance Variables:
	currentToken	<SmaCCToken>	the token last returned by the scanner that has not been shifted (reduce actions leave the current token alone)
	errorToken	<SmaCCToken>	the token where a parse error occurred
	nodeStack	<OrderedCollection of: Object>	collection of items on stack. These items are specific to the parser and can be any object. 
	scanner	<SmaCCScanner>	our scanner
	stateStack	<OrderedCollection of: Integer>	the stack of states for our parser (standard LR state stack)


"
Class {
	#name : #SmaCCParser,
	#superclass : #Object,
	#instVars : [
		'scanner',
		'currentToken',
		'errorToken',
		'stateStack',
		'nodeStack',
		'errorHandler'
	],
	#classInstVars : [
		'cacheId',
		'defaultEncoding'
	],
	#category : #'SmaCC_Runtime'
}

{ #category : #accessing }
SmaCCParser class >> ambiguousTransitions [
	^ #()
]

{ #category : #caching }
SmaCCParser class >> cacheId [
	^ '?'
]

{ #category : #caching }
SmaCCParser class >> checkCaches [
	cacheId ~= self cacheId
		ifTrue: [ self resetCaches.
			self scannerClass initialize.
			cacheId := self cacheId ]
]

{ #category : #accessing }
SmaCCParser class >> defaultEncoding [
	^ defaultEncoding
		ifNil: [ self == SmaCCParser
				ifTrue: [ nil ]
				ifFalse: [ superclass defaultEncoding ] ]
]

{ #category : #accessing }
SmaCCParser class >> defaultEncoding: aString [
	defaultEncoding := aString
]

{ #category : #accessing }
SmaCCParser class >> defaultStartingState [
	^ 1
]

{ #category : #accessing }
SmaCCParser class >> errorBlock: aBlock [
	^ [ :ex | 
	| returnValue |
	returnValue := aBlock numArgs = 3
		ifTrue:
			[ aBlock value: ex tag value: ex description value: ex tag ]
		ifFalse:
			[ aBlock numArgs = 1
				ifTrue: [ aBlock value: ex tag ]
				ifFalse: [ aBlock value: ex description value: ex tag position ] ].
	ex return: returnValue ]
]

{ #category : #'file types' }
SmaCCParser class >> fileExtension [
	^ ''
]

{ #category : #'file types' }
SmaCCParser class >> fileExtensionType [
	^ 'All files'
]

{ #category : #'file types' }
SmaCCParser class >> fileExtensions [
	^ Array with: self fileExtension
]

{ #category : #'instance creation' }
SmaCCParser class >> on: aStream [
	| parser scanner |
	self checkCaches.
	scanner := self scannerClass on: aStream.
	parser := self new.
	parser scanner: scanner.
	^ parser
]

{ #category : #parsing }
SmaCCParser class >> parse: aString [
	^ self parse: aString startingAt: self defaultStartingState
]

{ #category : #parsing }
SmaCCParser class >> parse: aString onError: aBlock [
	^ [ self parse: aString ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)
]

{ #category : #parsing }
SmaCCParser class >> parse: aString startingAt: anInteger [
	| value |
	value := self
		parseStream: (ReadStream on: aString)
		startingAt: anInteger.
	(value isKindOf: SmaCCParseNode)
		ifTrue: [ value completeSource: aString ].
	^ value
]

{ #category : #parsing }
SmaCCParser class >> parse: aString startingAt: anInteger onError: aBlock [
	^ [ self parse: aString startingAt: anInteger ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)
]

{ #category : #parsing }
SmaCCParser class >> parseFile: aString [
	^ self parseFile: aString encoding: self defaultEncoding
]

{ #category : #parsing }
SmaCCParser class >> parseFile: aString encoding: encodingString [
	^ aString asFileReference
		readStreamDo: [ :stream | 
			self setEncoding: encodingString on: stream.
			(self parseStream: stream startingAt: self defaultStartingState)
				ifNotNil: [ :each | 
					(each isKindOf: SmaCCParseNode)
						ifTrue: [ stream position: 0.
							each completeSource: stream contents.
							each filename: aString ] ] ]
]

{ #category : #parsing }
SmaCCParser class >> parseStream: aStream [
	^ self parseStream: aStream startingAt: self defaultStartingState
]

{ #category : #parsing }
SmaCCParser class >> parseStream: aStream onError: aBlock [
	^ [ self parseStream: aStream ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)
]

{ #category : #parsing }
SmaCCParser class >> parseStream: aStream startingAt: anInteger [
	| parser |
	parser := self on: aStream.
	parser setStartingState: anInteger.
	^ parser parse
]

{ #category : #parsing }
SmaCCParser class >> parseStream: aStream startingAt: anInteger onError: aBlock [
	^ [ self parseStream: aStream startingAt: anInteger ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)
]

{ #category : #parsing }
SmaCCParser class >> parseWithErrors: aString [
	^ self parseWithErrors: aString startingAt: self defaultStartingState
]

{ #category : #parsing }
SmaCCParser class >> parseWithErrors: aString startingAt: anInteger [
	^ [ | parser value |
	parser := self on: (ReadStream on: aString).
	parser setStartingState: anInteger.
	parser createDefaultErrorHandlers.
	value := parser parse.
	(value isKindOf: SmaCCParseNode)
		ifTrue: [ value completeSource: aString ].
	^ value ]
		on: SmaCCParserError
		do: [ :ex | 
			ex isResumable
				ifTrue: [ ex resume ]
				ifFalse: [ ex signal ] ]
]

{ #category : #accessing }
SmaCCParser class >> reduceTable [
	^ self subclassResponsibility
]

{ #category : #caching }
SmaCCParser class >> resetCaches [
	"self withAllSubclasses do: [:each | each resetCaches]"

	
]

{ #category : #accessing }
SmaCCParser class >> scannerClass [
	^ self subclassResponsibility
]

{ #category : #encoding }
SmaCCParser class >> setEncoding: aString on: aStream [
	"Handle Pharo 6/7 streaming differences"

	| encoding |
	encoding := aString ifNil: [ self defaultEncoding ifNil: [ 'utf-8' ] ].
	aStream encoding: encoding
]

{ #category : #encoding }
SmaCCParser class >> setEncodingOn: aStream [
	self setEncoding: nil on: aStream
]

{ #category : #accessing }
SmaCCParser class >> symbolNames [
	^ #()
]

{ #category : #accessing }
SmaCCParser class >> symbolTypes [
	^ #()
]

{ #category : #accessing }
SmaCCParser class >> transitionTable [
	^ self subclassResponsibility
]

{ #category : #'private-actions' }
SmaCCParser >> acceptAction [
	^ 0
]

{ #category : #'private-actions' }
SmaCCParser >> actionFor: aSymbolIndex [
	^ self actionForState: self currentState and: aSymbolIndex
]

{ #category : #'private-actions' }
SmaCCParser >> actionForCurrentToken [
	self tryAllTokens
		ifTrue:
			[ | ids action |
			ids := currentToken ids.
			1 to: ids size do:
				[ :i | 
				action := self actionFor: (ids at: i).
				(action bitAnd: self actionMask) = self errorAction
					ifFalse: [ ^ action ] ].
			^ self errorAction ]
		ifFalse: [ ^ self actionFor: currentToken ids first ]
]

{ #category : #'private-actions' }
SmaCCParser >> actionForState: stateIndex and: aSymbolIndex [
	| index row |
	row := self transitionTable at: stateIndex.
	^ (row at: 1) == 0
		ifTrue:
			[ index := self binarySearchIn: row for: aSymbolIndex size: 2.
			index == 0
				ifTrue: [ ^ self errorAction ]
				ifFalse: [ ^ ((row at: 2) bitShift: 8) + (row at: 3) ] ]
		ifFalse:
			[ index := self binarySearchIn: row for: aSymbolIndex size: 4.
			index == 0
				ifTrue: [ ^ self errorAction ]
				ifFalse: [ ^ ((row at: index - 2) bitShift: 8)
						+ (row at: index - 1) ] ]
]

{ #category : #'private-actions' }
SmaCCParser >> actionMask [
	^ 2r11
]

{ #category : #'private-actions' }
SmaCCParser >> actionsAndSymbolsForState: stateIndex do: aBlock [
	| action bytes |
	bytes := self transitionTable at: stateIndex.
	(bytes at: 1) = 0
		ifTrue: [ action := ((bytes at: 2) bitShift: 8) + (bytes at: 3).
			4 to: bytes size by: 2 do: [ :i | aBlock value: action value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1) ] ]
		ifFalse: [ 2 to: bytes size by: 4 do:
				[ :i | aBlock value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1) value: ((bytes at: i + 2) bitShift: 8) + (bytes at: i + 3) ] ]
]

{ #category : #'error handling' }
SmaCCParser >> actionsForState: stateIndex and: aSymbolIndex [
	^ Array with: (self actionForState: stateIndex and: aSymbolIndex)
]

{ #category : #'private-ast' }
SmaCCParser >> add: anObject to: aCollection [
	anObject isNil
		ifTrue: [ ^ self ].
	aCollection add: anObject
]

{ #category : #'private-ast' }
SmaCCParser >> addAll: origCollection to: aCollection [
	origCollection isNil
		ifTrue: [ ^ self ].
	origCollection
		do: [ :each | 
			each notNil
				ifTrue: [ aCollection add: each ] ]
]

{ #category : #'private-ast' }
SmaCCParser >> addAllFirst: origCollection to: aCollection [
	origCollection isNil ifTrue: [^self].
	origCollection reverseDo: [:each | each notNil ifTrue: [aCollection addFirst: each]]
]

{ #category : #'private-ast' }
SmaCCParser >> addFirst: anObject to: aCollection [
	anObject isNil ifTrue: [^self].
	aCollection addFirst: anObject
]

{ #category : #'private-actions' }
SmaCCParser >> allActionsAndSymbolsForState: stateIndex do: aBlock [
	self
		actionsAndSymbolsForState: stateIndex
		do: [ :action :symbol | 
			| row |
			(action bitAnd: self actionMask) = 2r11
				ifTrue: [ row := self ambiguousTransitions at: (action bitShift: -2).
					1 to: row size by: 2 do: [ :i | aBlock value: ((row at: i) bitShift: 8) + (row at: i + 1) value: symbol ] ]
				ifFalse: [ aBlock value: action value: symbol ] ]
]

{ #category : #private }
SmaCCParser >> ambiguousTransitions [
	^ self class ambiguousTransitions
]

{ #category : #private }
SmaCCParser >> binarySearchIn: aRow for: aSymbolIndex size: step [
	| start mid length high low midItem stop |
	high := aSymbolIndex bitShift: -8.
	low := aSymbolIndex bitAnd: 16rFF.
	start := 4.
	stop := aRow size - 1.
	length := (stop - start) // step.
	[ length > 4 ]
		whileTrue:
			[ length := length bitShift: -1.
			mid := length * step + start.
			midItem := aRow at: mid.
			((midItem == high and: [ (aRow at: mid + 1) <= low ])
				or: [ midItem < high ])
				ifTrue: [ start := mid ]
				ifFalse: [ stop := mid ] ].
	[ start <= stop ]
		whileTrue:
			[ ((aRow at: start) == high and: [ (aRow at: start + 1) == low ])
				ifTrue: [ ^ start ].
			start := start + step ].
	^ 0
]

{ #category : #'error handling' }
SmaCCParser >> checkForErrors [
	"If we have an error correction installed, we might have handled the errors. If we did, we may not 
	want to return the result. Raise an error with the location of the initial error. If we want the result,
	we can resume the exception."

	errorToken isNil
		ifTrue: [ ^ self ].
	currentToken := errorToken.
	self reportErrorMessage: 'Token not expected' resumable: true
]

{ #category : #'initialize-release' }
SmaCCParser >> createDefaultErrorHandlers [
	(self hasStateThatShifts: self errorTokenId)
		ifTrue: [ errorHandler := SmaCCSpecificErrorNodeHandler on: self ]
		ifFalse: [ self hasNodeTypes
				ifTrue: [ errorHandler := SmaCCDefaultErrorNodeHandler on: self ] ]
]

{ #category : #private }
SmaCCParser >> currentState [
	^ stateStack last
]

{ #category : #private }
SmaCCParser >> currentToken [
	^ currentToken
]

{ #category : #'error handling' }
SmaCCParser >> dismissErrorToken [
	| token |
	token := currentToken.
	currentToken := nil.
	self getNextToken.
	^ token
]

{ #category : #'error handling' }
SmaCCParser >> dismissStackTopForErrorRecovery: anInteger [
	| stackContents |
	stackContents := Array new: anInteger.
	anInteger to: 1 by: -1 do: [ :i | 
		stateStack removeLast.
		stackContents at: i put: nodeStack removeLast ].
	^ stackContents
]

{ #category : #accessing }
SmaCCParser >> emptySymbolTokenId [
	^ scanner emptySymbolTokenId
]

{ #category : #'private-actions' }
SmaCCParser >> errorAction [
	^ 3
]

{ #category : #'error handling' }
SmaCCParser >> errorSymbolShiftActionsForState: stateIndex [
	| action actions |
	actions := self actionsForState: stateIndex and: self errorTokenId.
	action := actions
		detect: [ :act | (act bitAnd: self actionMask) = self shiftAction ]
		ifNone: [ 0 ].
	^ (action bitAnd: self actionMask) = self shiftAction
		ifTrue: [ action bitShift: -2 ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
SmaCCParser >> errorTable [
	^ #()
]

{ #category : #accessing }
SmaCCParser >> errorToken [
	^ errorToken
]

{ #category : #'error handling' }
SmaCCParser >> errorToken: aSmaCCToken [
	errorToken notNil
		ifTrue: [ ^ self ].
	errorToken := aSmaCCToken
]

{ #category : #accessing }
SmaCCParser >> errorTokenId [
	^ scanner errorTokenId
]

{ #category : #private }
SmaCCParser >> getNextToken [
	currentToken isNil
		ifTrue: [ currentToken := scanner next ]
]

{ #category : #'error handling' }
SmaCCParser >> handleError: anInteger [
	^ errorHandler handleError: anInteger
]

{ #category : #testing }
SmaCCParser >> hasNodeTypes [
	^ self symbolTypes anySatisfy: [ :each | self isNodeType: each ]
]

{ #category : #testing }
SmaCCParser >> hasStateThatShifts: symbolIndex [
	1 to: self transitionTable size do: [ :i | 
		((self actionsForState: i and: symbolIndex) anySatisfy: [ :action | (action bitAnd: self actionMask) = self shiftAction ])
			ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #'initialize-release' }
SmaCCParser >> initialize [
	super initialize.
	nodeStack := OrderedCollection new.
	errorHandler := SmaCCNoErrorHandler on: self
]

{ #category : #testing }
SmaCCParser >> isEOFToken [
	^ currentToken ids first = self emptySymbolTokenId
]

{ #category : #testing }
SmaCCParser >> isNodeType: aSymbol [
	^ (Smalltalk at: aSymbol ifAbsent: [ Object ]) includesBehavior: SmaCCParseNode
]

{ #category : #'standard reduction rules' }
SmaCCParser >> liftFirstValue: aCollection [
	^ aCollection at: 1
]

{ #category : #'standard reduction rules' }
SmaCCParser >> liftLastValue: aCollection [
	^ aCollection last
]

{ #category : #'standard reduction rules' }
SmaCCParser >> liftSecondValue: aCollection [
	^ aCollection at: 2
]

{ #category : #'standard reduction rules' }
SmaCCParser >> nil [
	^ nil
]

{ #category : #private }
SmaCCParser >> nodeStack [
	^ nodeStack
]

{ #category : #accessing }
SmaCCParser >> parse [
	| result |
	self setDefaultStartingStateIfNone.
	self performParsingLoop.
	result := nodeStack last.
	(result respondsTo: #comments:)
		ifTrue: [ result comments: scanner comments ].
	^ result
]

{ #category : #'private-actions' }
SmaCCParser >> performAction: action [
	| value actionType |
	actionType := action bitAnd: self actionMask.
	value := action bitShift: -2.
	actionType == self shiftAction
		ifTrue: [ self shift: value ]
		ifFalse:
			[ actionType == self reduceAction
				ifTrue: [ self reduce: value ]
				ifFalse: [ self handleError: value ] ]
]

{ #category : #private }
SmaCCParser >> performParsingLoop [
	| action |
	[ self getNextToken.
	action := self actionForCurrentToken.
	action = self acceptAction ]
		whileFalse: [ self performAction: action ].
	self checkForErrors
]

{ #category : #private }
SmaCCParser >> performReduceMethod: aSymbol with: items [
	^ aSymbol last == $:
		ifTrue: [ self perform: aSymbol with: items ]
		ifFalse: [ self perform: aSymbol ]
]

{ #category : #private }
SmaCCParser >> popNodeStack [
	^ nodeStack removeLast
]

{ #category : #accessing }
SmaCCParser >> position [
	^ currentToken isNil
		ifTrue: [ scanner position ]
		ifFalse: [ currentToken startPosition ]
]

{ #category : #accessing }
SmaCCParser >> position: anInteger [
	scanner setPosition: anInteger
]

{ #category : #'private-actions' }
SmaCCParser >> reduce: anInteger [
	| reduceEntry items size |
	reduceEntry := self reduceTable at: anInteger.
	items := Array new: (size := reduceEntry at: 2).
	size to: 1 by: -1 do:
		[ :i | 
		items at: i put: self popNodeStack.
		stateStack removeLast ].
	nodeStack
		addLast: (self performReduceMethod: (reduceEntry at: 3) with: items).
	stateStack
		addLast: ((self actionFor: (reduceEntry at: 1)) bitShift: -2)
]

{ #category : #'private-actions' }
SmaCCParser >> reduceAction [
	^ 2r10
]

{ #category : #'private-actions' }
SmaCCParser >> reduceFor: aCollection [
	| newCollection item |
	(aCollection allSatisfy: [ :each | each class ~~ OrderedCollection ])
		ifTrue: [ ^ aCollection asOrderedCollection ].
	aCollection first class == OrderedCollection
		ifTrue:
			[ newCollection := aCollection first.
			2 to: aCollection size do:
				[ :i | 
				item := aCollection at: i.
				item class == OrderedCollection
					ifTrue: [ newCollection addAll: item ]
					ifFalse: [ newCollection add: item ] ].
			^ newCollection ].
	newCollection := OrderedCollection new.
	aCollection
		do:
			[ :each | 
			each class == OrderedCollection
				ifTrue: [ newCollection addAll: each ]
				ifFalse: [ newCollection add: each ] ].
	^ newCollection
]

{ #category : #accessing }
SmaCCParser >> reduceTable [
	^ self class reduceTable
]

{ #category : #'error handling' }
SmaCCParser >> reportError: anInteger [
	self
		reportErrorMessage:
			(anInteger = 0
				ifTrue: [ 'Token not expected' ]
				ifFalse: [ self errorTable at: anInteger ])
]

{ #category : #'error handling' }
SmaCCParser >> reportErrorMessage: aString [
	self reportErrorMessage: aString resumable: false
]

{ #category : #'error handling' }
SmaCCParser >> reportErrorMessage: aString resumable: aBoolean [
	SmaCCParserError new
		isResumable: aBoolean;
		messageText: aString;
		tag: self;
		signal
]

{ #category : #accessing }
SmaCCParser >> scanner [
	^ scanner
]

{ #category : #'initialize-release' }
SmaCCParser >> scanner: aScanner [
	scanner := aScanner
]

{ #category : #accessing }
SmaCCParser >> scope [
	^ scanner scope
]

{ #category : #accessing }
SmaCCParser >> scope: aSymbol [
	scanner scope: aSymbol
]

{ #category : #'initialize-release' }
SmaCCParser >> setDefaultStartingStateIfNone [
	stateStack isNil
		ifTrue: [ self setStartingState: self class defaultStartingState ]
]

{ #category : #'initialize-release' }
SmaCCParser >> setStartingState: startingState [
	stateStack := OrderedCollection with: startingState
]

{ #category : #'private-actions' }
SmaCCParser >> shift: stateIndex [
	stateStack addLast: stateIndex.
	nodeStack addLast: currentToken.
	currentToken := nil
]

{ #category : #'private-actions' }
SmaCCParser >> shiftAction [
	^ 2r01
]

{ #category : #private }
SmaCCParser >> stateStack [
	^ stateStack
]

{ #category : #'standard reduction rules' }
SmaCCParser >> stringValue: anOrderedCollection [
	^ anOrderedCollection first value
]

{ #category : #accessing }
SmaCCParser >> symbolNames [
	^ self class symbolNames
]

{ #category : #accessing }
SmaCCParser >> symbolTypes [
	^ self class symbolTypes
]

{ #category : #accessing }
SmaCCParser >> transitionTable [
	^ self class transitionTable
]

{ #category : #testing }
SmaCCParser >> tryAllTokens [
	^ false
]

{ #category : #'error handling' }
SmaCCParser >> willAccept: potentialStateStack [
	| action compoundAction reduceEntry size |
	compoundAction := self actionForState: potentialStateStack last and: self emptySymbolTokenId.
	action := compoundAction bitAnd: self actionMask.
	action == self acceptAction
		ifTrue: [ ^ true ].
	action == self reduceAction
		ifTrue: [ reduceEntry := self reduceTable at: (compoundAction bitShift: -2).
			size := reduceEntry at: 2.
			size timesRepeat: [ potentialStateStack removeLast ].
			potentialStateStack add: ((self actionForState: potentialStateStack last and: (reduceEntry at: 1)) bitShift: -2).
			^ self willAccept: potentialStateStack ].
	^ false
]

{ #category : #'error handling' }
SmaCCParser >> willShift: potentialStateStack [
	| action compoundAction reduceEntry size |
	compoundAction := self actionForState: potentialStateStack last and: currentToken ids first.
	action := compoundAction bitAnd: self actionMask.
	action == self shiftAction
		ifTrue: [ ^ true ].
	action == self reduceAction
		ifTrue: [ reduceEntry := self reduceTable at: (compoundAction bitShift: -2).
			size := reduceEntry at: 2.
			size timesRepeat: [ potentialStateStack removeLast ].
			potentialStateStack add: ((self actionForState: potentialStateStack last and: (reduceEntry at: 1)) bitShift: -2).
			^ self willShift: potentialStateStack ].
	^ false
]
