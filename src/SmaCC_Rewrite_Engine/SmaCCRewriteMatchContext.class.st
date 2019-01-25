Class {
	#name : #SmaCCRewriteMatchContext,
	#superclass : #Object,
	#instVars : [
		'rewriteEngine',
		'match',
		'nodes',
		'strings',
		'continuation'
	],
	#classVars : [
		'Continue',
		'SilentProperties',
		'Uninitialized'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #compiling }
SmaCCRewriteMatchContext class >> compiledMethodFor: aString [
	^ [ "Pharo"
	(self compiler
		source: aString;
		requestor: nil;
		failBlock: [ ^ nil ];
		compile) copyWithSource: aString ]
		on: Error
		do: [ :ex | 
			"Squeak version"
			ex
				return:
					(self
						compile: aString
						notifying: nil
						trailer: self defaultMethodTrailer
						ifFail: [ ^ nil ]) method ]
]

{ #category : #accessing }
SmaCCRewriteMatchContext class >> continue [
	^ Continue
]

{ #category : #'instance creation' }
SmaCCRewriteMatchContext class >> forNode: aSmaCCParseNode rewriter: aSmaCCRewriteEngine continuation: aBlock [
	^ self new
		forNode: aSmaCCParseNode
			rewriter: aSmaCCRewriteEngine
			continuation: aBlock;
		yourself
]

{ #category : #'class initialization' }
SmaCCRewriteMatchContext class >> initialize [
	Continue := Object new.
	SilentProperties := false.
	Uninitialized := Object new
]

{ #category : #accessing }
SmaCCRewriteMatchContext class >> silentProperties [
	^ SilentProperties
]

{ #category : #accessing }
SmaCCRewriteMatchContext class >> silentProperties: anObject [
	SilentProperties := anObject
]

{ #category : #accessing }
SmaCCRewriteMatchContext class >> uninitializedValue [
	^ Uninitialized
]

{ #category : #'accessing-methods' }
SmaCCRewriteMatchContext >> addGlobalProperty: aSymbol withValueFrom: aBlock [
	rewriteEngine rewriteRule propertyAt: aSymbol ifAbsentPut: aBlock.
	self
		addMethodNamed: aSymbol
		as: [ rewriteEngine rewriteRule propertyAt: aSymbol ].
	self
		addMethodNamed: (aSymbol , ':') asSymbol
		as: [ :value | rewriteEngine rewriteRule propertyAt: aSymbol put: value ]
]

{ #category : #'accessing-methods' }
SmaCCRewriteMatchContext >> addMethodNamed: aSymbol as: aBlock [
	rewriteEngine addMethodNamed: aSymbol as: aBlock
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> addNewlineWhitespace: aString to: source [
	| outputStream inputStream |
	(aString notNil and: [ aString notEmpty ])
		ifFalse: [ ^ source ].
	outputStream := WriteStream on: String new.
	inputStream := ReadStream on: source asString.
	[ inputStream atEnd ]
		whileFalse:
			[ | char endOfLine |
			endOfLine := false.
			char := inputStream next.
			char = Character lf
				ifTrue: [ endOfLine := true ].
			char = Character cr
				ifTrue:
					[ endOfLine := true.
					inputStream peek = Character lf
						ifTrue: [ outputStream nextPut: char.
							char := inputStream next ] ].
			outputStream nextPut: char.
			endOfLine
				ifTrue: [ outputStream nextPutAll: aString ] ].
	^ outputStream contents
]

{ #category : #'accessing-methods' }
SmaCCRewriteMatchContext >> addProperty: aSymbol withValue: anObject [
	| property |
	property := anObject.
	self addMethodNamed: aSymbol as: [ property ].
	self
		addMethodNamed: (aSymbol , ':') asSymbol
		as: [ :value | property := value ]
]

{ #category : #'accessing-properites' }
SmaCCRewriteMatchContext >> additionalFiles [
	^ rewriteEngine additionalFiles
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> characterAt: anIndex [
	^ self source at: anIndex
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> characterAtEndOf: aSmaCCNode [
	| index |
	index := self stopIndexFor: aSmaCCNode.
	^ self
		characterAt:
			((self source isRemoved: index)
				ifTrue: [ self source previousIndex: index ]
				ifFalse: [ index ])
]

{ #category : #testing }
SmaCCRewriteMatchContext >> charactersAtAndAfter: startPosition matchesToken: aSmaCCToken [
	| string position |
	position := startPosition.
	position isNil
		ifTrue: [ ^ false ].
	string := aSmaCCToken value.
	1 to: string size do:
		[ :i | 
		(string at: i) = (self originalSource at: position)
			ifFalse: [ ^ false ].
		position := self nextIndex: position ].
	^ true
]

{ #category : #testing }
SmaCCRewriteMatchContext >> charactersAtAndBefore: stopPosition matchesToken: aSmaCCToken [
	| string position |
	position := stopPosition.
	position isNil
		ifTrue: [ ^ false ].
	string := aSmaCCToken value.
	string size to: 1 do:
		[ :i | 
		(string at: i) = (self originalSource at: position)
			ifFalse: [ ^ false ].
		position := self previousIndex: position ].
	^ true
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> computeStringFor: value [
	(value isKindOf: Collection)
		ifTrue:
			[ | first last |
			first := last := nil.
			value
				do:
					[ :each | 
					(each isKindOf: SmaCCParseNode)
						ifTrue:
							[ self processChild: each.
							first isNil
								ifTrue: [ first := self startIndexFor: each ].
							(self stopIndexFor: each)
								ifNotNil: [ :i | 
									i ~= 0
										ifTrue: [ last := i ] ] ]
						ifFalse:
							[ (each isKindOf: SmaCCToken)
								ifTrue:
									[ first isNil
										ifTrue: [ first := value startPosition ].
									last := value stopPosition ] ] ].
			(first notNil and: [ last notNil ])
				ifTrue: [ ^ self sourceFrom: first to: last ] ].
	(value isKindOf: SmaCCParseNode)
		ifTrue: [ ^ self rewrite: value ].
	^ (value isKindOf: SmaCCToken)
		ifTrue: [ value value ]
		ifFalse: [ value ]
]

{ #category : #'initialize-release' }
SmaCCRewriteMatchContext >> context: aDictionary [
	aDictionary
		keysAndValuesDo:
			[ :key :value | 
			| cachedString |
			nodes at: key name put: value.
			strings
				at: key name
				put: [ cachedString ifNil: [ cachedString := self computeStringFor: value ] ] ]
]

{ #category : #processing }
SmaCCRewriteMatchContext >> continue [
	continuation value
]

{ #category : #processing }
SmaCCRewriteMatchContext >> debugMethod: aMethod message: aString [
	| newContext process |
	newContext := Context
		sender: thisContext sender
		receiver: self
		method: aMethod
		arguments: #().
	newContext push: self.
	process := Processor activeProcess.
	[ process suspend.
	process suspendedContext: newContext.
	process restartTop.
	process debug: newContext title: 'Debugging ' , aString full: true ] forkAt: process priority + 1
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> delete: anObject [
	| start stop |
	start := self startIndexFor: anObject.
	stop := self stopIndexFor: anObject.
	self deleteFrom: start to: stop
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteAll: aCollection [
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self delete: each ]
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteAllWithWhitespaceAfter: aCollection [
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self deleteWithWhitespaceAfter: each ]
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteAllWithWhitespaceBefore: aCollection [
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self deleteWithWhitespaceBefore: each ]
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteFrom: start to: stop [
	| startIndex stopIndex |
	startIndex := self startIndexFor: start.
	stopIndex := self stopIndexFor: stop.
	(startIndex isNil or: [ stopIndex isNil ])
		ifTrue: [ ^ self ].
	self source deleteFrom: startIndex to: stopIndex
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteWhitespaceAfter: anObject [
	| anIndex |
	anIndex := self stopIndexFor: anObject.
	self source deleteWhitespaceAfterIndex: anIndex
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteWhitespaceBefore: anObject [
	| anIndex |
	anIndex := self startIndexFor: anObject.
	self source deleteWhitespaceBeforeIndex: anIndex
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteWithWhitespaceAfter: anObject [
	self deleteWhitespaceAfter: anObject.
	self delete: anObject
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> deleteWithWhitespaceBefore: anObject [
	self deleteWhitespaceBefore: anObject.
	self delete: anObject
]

{ #category : #'accessing-methods' }
SmaCCRewriteMatchContext >> doesNotUnderstand: aMessage [
	| method |
	method := rewriteEngine methodNamed: aMessage selector.
	method isNil
		ifTrue:
			[ SilentProperties
				ifTrue:
					[ aMessage arguments size = 1
						ifTrue:
							[ ^ rewriteEngine
								propertyAt:
									(aMessage selector copyFrom: 1 to: aMessage selector size - 1)
										asSymbol
								put: aMessage arguments first ].
					aMessage arguments isEmpty
						ifTrue: [ ^ rewriteEngine
								propertyAt: aMessage selector
								ifAbsent: [ nil ] ] ].
			^ super doesNotUnderstand: aMessage ].
	method numArgs - 1 = aMessage arguments size
		ifTrue: [ ^ method
				valueWithArguments: (Array with: self) , aMessage arguments ].
	^ method valueWithArguments: aMessage arguments
]

{ #category : #'initialize-release' }
SmaCCRewriteMatchContext >> forNode: aSmaCCParseNode rewriter: aSmaCCRewriteEngine continuation: aBlock [
	rewriteEngine := aSmaCCRewriteEngine.
	match := aSmaCCParseNode.
	continuation := aBlock.
	nodes := Dictionary new.
	strings := Dictionary new
]

{ #category : #testing }
SmaCCRewriteMatchContext >> hasChild: anObject position: positionSelector [
	| position node |
	node := nil.
	(anObject isKindOf: SequenceableCollection)
		ifTrue:
			[ node := positionSelector = #startPosition
				ifTrue: [ anObject first ]
				ifFalse: [ anObject last ] ].
	(anObject isKindOf: SmaCCParseNode)
		ifTrue: [ node := anObject ].
	anObject isNil
		ifTrue: [ ^ false ].
	position := node perform: positionSelector.
	node
		nodesDo:
			[ :child | 
			(child perform: positionSelector) = position
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
SmaCCRewriteMatchContext >> hasChildAtEndOf: anObject [
	^ self hasChild: anObject position: #stopPosition
]

{ #category : #testing }
SmaCCRewriteMatchContext >> hasChildAtStartOf: anObject [
	^ self hasChild: anObject position: #startPosition
]

{ #category : #'accessing-properites' }
SmaCCRewriteMatchContext >> initializeGlobalProperty: aSymbol withValueFrom: aBlock [
	(self class classPool at: aSymbol ifAbsent: [ nil ]) == SmaCCRewriteMatchContext uninitializedValue
		ifTrue: [ self class classPool at: aSymbol put: aBlock value ]
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> insert: aString after: anObject [
	| position endPosition anIndex |
	anIndex := self stopIndexFor: anObject.
	anIndex isNil
		ifTrue: [ ^ nil ].
	position := self source
		insert: aString
		at: (self source nextIndex: anIndex).
	position isNil
		ifTrue: [ ^ nil ].
	endPosition := position + (aString size - 1).
	self
		updateStopPositionFor:
			((anObject isKindOf: SmaCCParseNode)
				ifTrue: [ anObject ]
				ifFalse: [ match ])
		to: endPosition
		whenEqualTo: anIndex.
	^ position
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> insert: aString afterAll: aCollection [
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self insert: aString after: each ]
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> insert: aSequenceableCollection around: aNode [
	self insert: aSequenceableCollection first before: aNode.
	self insert: aSequenceableCollection last after: aNode
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> insert: aString before: anObject [
	| position anIndex |
	anIndex := self startIndexFor: anObject.
	anIndex isNil
		ifTrue: [ ^ nil ].
	position := self source insert: aString at: anIndex.
	rewriteEngine
		updateStartPositionFor:
			((anObject isKindOf: SmaCCParseNode)
				ifTrue: [ anObject ]
				ifFalse: [ match ])
		to: position
		whenEqualTo: anIndex.
	^ position
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> insert: aString beforeAll: aCollection [
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self insert: aString before: each ]
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> insert: aString between: aCollection [
	aCollection isNil
		ifTrue: [ ^ self ].
	1 to: aCollection size - 1 do: [ :i | self insert: aString after: (aCollection at: i) ]
]

{ #category : #testing }
SmaCCRewriteMatchContext >> isAtEndOfParent: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self isAtEndOfParent: each ] ].
	^ (anObject isKindOf: SmaCCParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent stopPosition = anObject stopPosition ] ]
]

{ #category : #testing }
SmaCCRewriteMatchContext >> isAtStartOfParent: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject do: [ :each | ^ self isAtStartOfParent: each ] ].
	^ (anObject isKindOf: SmaCCParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent startPosition = anObject startPosition ] ]
]

{ #category : #processing }
SmaCCRewriteMatchContext >> markAllAsProcessed: aCollection [
	aCollection do: [ :each | self markAsProcessed: each ]
]

{ #category : #processing }
SmaCCRewriteMatchContext >> markAsProcessed: aSmaCCParseNode [
	rewriteEngine markAsProcessed: aSmaCCParseNode
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> match [
	^ match
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> match: anObject [
	match := anObject
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> move: anObject after: anotherObject [
	^ self move: anObject after: anotherObject withWhitespace: ''
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> move: anObject after: anotherObject withWhitespace: aString [
	| start stop oldStop |
	start := self startIndexFor: anObject.
	stop := self stopIndexFor: anObject.
	oldStop := self stopIndexFor: anotherObject.
	self source moveFrom: start to: stop after: oldStop.
	aString notEmpty
		ifTrue:
			[ self source addNewLineWhitespace: aString from: start to: stop ].
	rewriteEngine
		updateStopPositionFor:
			((anotherObject isKindOf: SmaCCParseNode)
				ifTrue: [ anotherObject ]
				ifFalse: [ match ])
		to: stop
		whenEqualTo: oldStop.
	^ self startIndexFor: anotherObject
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> move: anObject before: anotherObject [
	^ self move: anObject before: anotherObject withWhitespace: ''
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> move: anObject before: anotherObject withWhitespace: aString [
	| start stop oldStart |
	start := self startIndexFor: anObject.
	stop := self stopIndexFor: anObject.
	oldStart := self startIndexFor: anotherObject.
	self source moveFrom: start to: stop before: oldStart.
	aString notEmpty
		ifTrue:
			[ self source addNewLineWhitespace: aString from: start to: stop ].
	rewriteEngine
		updateStartPositionFor:
			((anotherObject isKindOf: SmaCCParseNode)
				ifTrue: [ anotherObject ]
				ifFalse: [ match ])
		to: start
		whenEqualTo: oldStart.
	^ self startIndexFor: anObject
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> move: anObject replacing: anotherObject withWhitespace: aString [
	| oldStop |
	oldStop := self stopIndexFor: anotherObject.
	self move: anObject after: anotherObject withWhitespace: aString.
	self deleteFrom: (self startIndexFor: anotherObject) to: oldStop.
	^ self startIndexFor: anObject
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> moveFrom: startIndex to: stopIndex after: anObject [
	^ self source
		moveFrom: (self startIndexFor: startIndex)
		to: (self stopIndexFor: stopIndex)
		after: (self startIndexFor: anObject)
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> moveFrom: startIndex to: stopIndex before: anObject [
	^ self source
		moveFrom: (self startIndexFor: startIndex)
		to: (self stopIndexFor: stopIndex)
		before: (self startIndexFor: anObject)
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> nextIndex: position [
	^ self originalSource nextIndex: position
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> nodeFor: aString [
	^ nodes at: aString ifAbsent: [ nil ]
]

{ #category : #private }
SmaCCRewriteMatchContext >> nodes [
	^nodes
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> originalSource [
	^ match completeSource
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> originalStartIndexFor: anObject [
	^ ((anObject isKindOf: SmaCCParseNode)
		or: [ anObject isKindOf: SmaCCToken ])
		ifTrue: [ anObject startPosition ]
		ifFalse: [ anObject ]
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> originalStartPosition: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				do: [ :each | ^ self originalStartPosition: each ] ].
	((anObject isKindOf: SmaCCParseNode)
		or: [ anObject isKindOf: SmaCCToken ])
		ifTrue: [ ^ anObject startPosition ].
	^ nil
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> originalStopPosition: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self originalStopPosition: each ] ].
	((anObject isKindOf: SmaCCParseNode)
		or: [ anObject isKindOf: SmaCCToken ])
		ifTrue: [ ^ anObject stopPosition ].
	^ nil
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> outputDirectory [
	^ rewriteEngine outputDirectory
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> outputDirectory: aString [
	^ rewriteEngine outputDirectory: aString
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> outputFilename [
	^ rewriteEngine outputFilename
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> outputFilename: aString [
	^ rewriteEngine outputFilename: aString
]

{ #category : #parsing }
SmaCCRewriteMatchContext >> parseCsvStream: aStream withHeader: aBoolean [
	| array result header line |
	header := nil.
	result := OrderedCollection new.
	(CSVParser parseStream: aStream) lines
		do:
			[ :each | 
			array := each values
				collect: [ :token | self removeQuotesAround: token value ].
			aBoolean
				ifTrue:
					[ header isNil
						ifTrue: [ header := array ]
						ifFalse:
							[ line := Dictionary new.
							1 to: (header size min: array size) do: [ :i | line at: (header at: i) put: (array at: i) ].
							array size + 1 to: header size do: [ :i | line at: (header at: i) put: nil ].
							result add: line ] ]
				ifFalse: [ result add: array ] ].
	^ result
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> previousIndex: position [
	^ self originalSource previousIndex: position
]

{ #category : #processing }
SmaCCRewriteMatchContext >> processChild: aSmaCCParseNode [
	rewriteEngine rewriteNode: aSmaCCParseNode
]

{ #category : #processing }
SmaCCRewriteMatchContext >> processChildren [
	match nodesDo: [ :each | self processChild: each ]
]

{ #category : #processing }
SmaCCRewriteMatchContext >> processChildren: aCollection [
	aCollection do: [ :each | self processChild: each ]
]

{ #category : #'accessing-properites' }
SmaCCRewriteMatchContext >> propertyAt: aString [
	^ rewriteEngine propertyAt: aString
]

{ #category : #'accessing-properites' }
SmaCCRewriteMatchContext >> propertyAt: aString ifAbsent: aBlock [
	^ rewriteEngine propertyAt: aString ifAbsent: aBlock
]

{ #category : #'accessing-properites' }
SmaCCRewriteMatchContext >> propertyAt: aString ifAbsentPut: aBlock [
	^ rewriteEngine propertyAt: aString ifAbsentPut: aBlock
]

{ #category : #'accessing-properites' }
SmaCCRewriteMatchContext >> propertyAt: aString put: anObject [
	^ rewriteEngine propertyAt: aString put: anObject
]

{ #category : #'accessing-properites' }
SmaCCRewriteMatchContext >> removeProperty: aString [
	^ rewriteEngine removeProperty: aString
]

{ #category : #parsing }
SmaCCRewriteMatchContext >> removeQuotesAround: aString [
	aString isEmpty
		ifTrue: [ ^ aString ].
	aString first = $'
		ifTrue:
			[ ^ (aString copyFrom: 2 to: aString size - 1)
				copyReplaceAll: ''''''
				with: '''' ].
	aString first = $"
		ifTrue:
			[ ^ (aString copyFrom: 2 to: aString size - 1)
				copyReplaceAll: '""'
				with: '"' ].
	^ aString
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> replace: anObject with: aString [
	anObject isNil
		ifTrue: [ ^ self ].
	self delete: anObject.
	self insert: aString before: anObject
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> replaceAll: aCollection with: aString [
	aCollection do: [ :each | self replace: each with: aString ]
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> replaceFrom: startIndex to: stopIndex with: aString [
	self insert: aString before: startIndex.
	self deleteFrom: startIndex to: stopIndex
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> rewrite: aSmaCCParseNode [
	^ rewriteEngine rewrite: aSmaCCParseNode
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> rewriteEngine [
	^ rewriteEngine
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> rewriteEngine: anObject [
	rewriteEngine := anObject
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> safe: aBlock [
	^ aBlock
		on: Error
		do: [ :ex | ex return ]
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> smaccStringClass [
	^ self source class
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> source [
	^ rewriteEngine source
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> sourceFor: anObject [
	anObject isNil
		ifTrue: [ ^ '' ].
	^ (self
		sourceFrom: (self startIndexFor: anObject)
		to: (self stopIndexFor: anObject)) asString
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> sourceFrom: first to: last [
	^ (self source
		copyFrom: (self startIndexFor: first)
		to: (self stopIndexFor: last)) asString
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> startIndexFor: anObject [
	^ ((anObject isKindOf: SmaCCParseNode)
		or: [ anObject isKindOf: SmaCCToken ])
		ifTrue: [ rewriteEngine startPositionForNode: anObject ]
		ifFalse: [ anObject ]
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> startOfLineWhitespaceBefore: anObject [
	^ self originalSource
		startOfLineWhitespaceBeforeIndex: (self originalStartIndexFor: anObject)
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> stopIndexFor: anObject [
	^ ((anObject isKindOf: SmaCCParseNode)
		or: [ anObject isKindOf: SmaCCToken ])
		ifTrue: [ rewriteEngine stopPositionForNode: anObject ]
		ifFalse: [ anObject ]
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> stringFor: aString [
	^ (strings at: aString ifAbsent: [ [ '' ] ]) value
]

{ #category : #private }
SmaCCRewriteMatchContext >> strings [
	^strings
]

{ #category : #'source editing' }
SmaCCRewriteMatchContext >> updateStopPositionFor: node to: endPosition whenEqualTo: anIndex [
	rewriteEngine
		updateStopPositionFor: node
		to: endPosition
		whenEqualTo: anIndex
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> whitespaceAfter: anObject [
	^ self originalSource
		whitespaceAfterIndex: (self stopIndexFor: anObject)
]

{ #category : #accessing }
SmaCCRewriteMatchContext >> whitespaceBefore: anObject [
	^ self originalSource
		whitespaceBeforeIndex: (self originalStartIndexFor: anObject)
]
