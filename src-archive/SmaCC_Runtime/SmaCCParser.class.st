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
		'nodeStack'
	],
	#classInstVars : [
		'cacheId',
		'defaultEncoding'
	],
	#category : #'SmaCC_Runtime'
}

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
	(aStream respondsTo: #encoding:)
		ifTrue: [ aStream encoding: encoding ]
		ifFalse: [ aStream converter: (TextConverter newForEncoding: encoding) ]
]

{ #category : #encoding }
SmaCCParser class >> setEncodingOn: aStream [
	self setEncoding: nil on: aStream
]

{ #category : #private }
SmaCCParser >> acceptAction [
	^ 0
]

{ #category : #private }
SmaCCParser >> actionFor: aSymbolIndex [
	^ self actionForState: self currentState and: aSymbolIndex
]

{ #category : #private }
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

{ #category : #private }
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

{ #category : #private }
SmaCCParser >> actionMask [
	^ 2r11
]

{ #category : #private }
SmaCCParser >> add: anObject to: aCollection [
	anObject isNil
		ifTrue: [ ^ self ].
	aCollection add: anObject
]

{ #category : #private }
SmaCCParser >> addAll: origCollection to: aCollection [
	origCollection isNil
		ifTrue: [ ^ self ].
	origCollection
		do: [ :each | 
			each notNil
				ifTrue: [ aCollection add: each ] ]
]

{ #category : #private }
SmaCCParser >> addAllFirst: origCollection to: aCollection [
	origCollection isNil ifTrue: [^self].
	origCollection reverseDo: [:each | each notNil ifTrue: [aCollection addFirst: each]]
]

{ #category : #private }
SmaCCParser >> addFirst: anObject to: aCollection [
	anObject isNil ifTrue: [^self].
	aCollection addFirst: anObject
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
	"If we have an error correction installed, we might have handled the errors. If we did, we don't 
	want to return the result, so we raise a final exception that can't be proceeded."

	errorToken isNil
		ifTrue: [ ^ self ].
	currentToken := errorToken.
	self reportErrorMessage: 'Token not expected'
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
	currentToken := nil.
	self getNextToken
]

{ #category : #'error handling' }
SmaCCParser >> dismissStackTopForErrorRecovery [
	stateStack removeLast.
	^ nodeStack removeLast
]

{ #category : #accessing }
SmaCCParser >> emptySymbolTokenId [
	^ scanner emptySymbolTokenId
]

{ #category : #private }
SmaCCParser >> errorAction [
	^ 3
]

{ #category : #'error handling' }
SmaCCParser >> errorHandlerStates [
	^ stateStack
		collect:
			[ :each | 
			| action |
			action := self actionForState: each and: self errorTokenId.
			(action bitAnd: self actionMask) = 1
				ifTrue: [ action bitShift: -2 ]
				ifFalse: [ 0 ] ]
]

{ #category : #accessing }
SmaCCParser >> errorTable [
	^ #()
]

{ #category : #accessing }
SmaCCParser >> errorToken [
	^ errorToken
]

{ #category : #accessing }
SmaCCParser >> errorTokenId [
	^ scanner errorTokenId
]

{ #category : #'error handling' }
SmaCCParser >> findErrorHandlerIfNoneUseErrorNumber: anInteger [
	| handlerStates index startingErrorToken |
	handlerStates := self errorHandlerStates reverse.
	startingErrorToken := currentToken.
	[ index := (1 to: handlerStates size)
		detect:
			[ :each | 
			| state newStack |
			state := handlerStates at: each.
			state ~= 0
				and:
					[ newStack := stateStack copyFrom: 1 to: handlerStates size - each + 1.
					newStack addLast: state.
					self willShift: newStack ] ]
		ifNone: [ nil ].
	index isNil ]
		whileTrue:
			[ self dismissErrorToken.
			self isEOFToken
				ifTrue:
					[ currentToken := startingErrorToken.
					self reportError: anInteger ] ].
	index - 1 timesRepeat: [ self dismissStackTopForErrorRecovery ].
	stateStack addLast: (handlerStates at: index).
	nodeStack addLast: startingErrorToken
]

{ #category : #private }
SmaCCParser >> getNextToken [
	currentToken isNil
		ifTrue: [ currentToken := scanner next ]
]

{ #category : #'error handling' }
SmaCCParser >> handleError: anInteger [
	errorToken isNil
		ifTrue: [ errorToken := currentToken ].
	(self isEOFToken or: [ self hasErrorHandler not ])
		ifTrue: [ self reportError: anInteger ].
	self findErrorHandlerIfNoneUseErrorNumber: anInteger
]

{ #category : #'error handling' }
SmaCCParser >> hasErrorHandler [
	^ self errorHandlerStates anySatisfy: [ :each | each ~~ 0 ]
]

{ #category : #'initialize-release' }
SmaCCParser >> initialize [
	super initialize.
	nodeStack := OrderedCollection new
]

{ #category : #testing }
SmaCCParser >> isEOFToken [
	^ currentToken ids first = self emptySymbolTokenId
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

{ #category : #private }
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

{ #category : #private }
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

{ #category : #private }
SmaCCParser >> reduceAction [
	^ 2r10
]

{ #category : #private }
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
	^ self subclassResponsibility
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
	SmaCCParserError new
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

{ #category : #private }
SmaCCParser >> shift: stateIndex [
	stateStack addLast: stateIndex.
	nodeStack addLast: currentToken.
	currentToken := nil
]

{ #category : #private }
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
	^ #()
]

{ #category : #accessing }
SmaCCParser >> symbolTypes [
	^ #()
]

{ #category : #accessing }
SmaCCParser >> transitionTable [
	^ self subclassResponsibility
]

{ #category : #testing }
SmaCCParser >> tryAllTokens [
	^ false
]

{ #category : #'error handling' }
SmaCCParser >> willShift: potentialStateStack [
	| action compoundAction reduceEntry size |
	compoundAction := self
		actionForState: potentialStateStack last
		and: currentToken ids first.
	action := compoundAction bitAnd: self actionMask.
	action == self shiftAction
		ifTrue: [ ^ true ].
	action == self reduceAction
		ifTrue:
			[ reduceEntry := self reduceTable at: (compoundAction bitShift: -2).
			size := reduceEntry at: 2.
			size timesRepeat: [ potentialStateStack removeLast ].
			potentialStateStack
				add:
					((self
						actionForState: potentialStateStack last
						and: (reduceEntry at: 1)) bitShift: -2).
			^ self willShift: potentialStateStack ].
	^ false
]
