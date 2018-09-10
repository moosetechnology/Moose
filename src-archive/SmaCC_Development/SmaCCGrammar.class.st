Class {
	#name : #SmaCCGrammar,
	#superclass : #Object,
	#instVars : [
		'type',
		'shiftReduceTable',
		'symbols',
		'scannerDefinition',
		'otherStartingSymbols',
		'classDefinitions',
		'prefix',
		'suffix',
		'codeGenerator',
		'isGLR',
		'ignoreCase',
		'ignoredVariables',
		'annotateTokens',
		'errorSymbol',
		'emptySymbol',
		'sentinelSymbol'
	],
	#classVars : [
		'IsExpressionMap',
		'IsExpressionMaxCharacter',
		'IsExpressions',
		'MaximumCharacterValue',
		'TokenNameBlock',
		'TokenNameMap'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCGrammar class >> allCharacters [
	^ SmaCCCharacterSet withAllCharactersTo: (Character value: self maximumCharacterValue)
]

{ #category : #private }
SmaCCGrammar class >> charactersFor: aSymbol [
	| isExpressionMap |
	isExpressionMap := self isExpressionMap.
	^ isExpressionMap at: aSymbol ifAbsentPut: [ self generateCharacterSetFor: aSymbol ]
]

{ #category : #accessing }
SmaCCGrammar class >> defaultTokenNameFor: aString [
	| stream string |
	stream := WriteStream on: String new.
	aString
		do:
			[ :each | 
			| value |
			value := self tokenNameMap at: each ifAbsent: [ each ].
			value isString
				ifTrue:
					[ stream
						nextPutAll:
							(stream position = 0
								ifTrue: [ value ]
								ifFalse: [ value capitalized ]) ]
				ifFalse: [ stream
						nextPut:
							(value isAlphaNumeric
								ifTrue: [ value ]
								ifFalse: [ $_ ]) ] ].
	string := stream contents.
	string first isDigit
		ifTrue: [ string := '_' , string ].
	string first isUppercase
		ifTrue: [ string at: 1 put: string first asLowercase ].
	^ string , 'Token'
]

{ #category : #accessing }
SmaCCGrammar class >> defaultTokenNameMap [
	| map |
	map := Dictionary new.
	#(#($< 'lessThan') #($> 'greaterThan') #($= 'equal') #($( 'leftParen') #($) 'rightParen') #(${ 'leftBrace') #($} 'rightBrace') #($[ 'leftBracket') #($] 'rightBracket') #($, 'comma') #($; 'semicolon') #($- 'minus') #($+ 'plus') #($* 'times') #($/ 'divide') #($: 'colon') #($. 'period') #($? 'questionMark') #($! 'bang') #($% 'percent') #($^ 'upArrow') #($& 'and') #($| 'or') #($~ 'tilde'))
		do: [ :each | map at: each first put: each last ].
	^ map
]

{ #category : #private }
SmaCCGrammar class >> generateCharacterSetFor: aSelector [
	| set |
	set := SmaCCCharacterSet new.
	0 to: self maximumCharacterValue do: [ :i | 
		| ch |
		ch := Character value: i.
		(ch perform: aSelector)
			ifTrue: [ set add: ch ] ].
	^ set
]

{ #category : #accessing }
SmaCCGrammar class >> implicitToken: aString [
	| symbol node |
	symbol := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	(Character canUnderstand: symbol)
		ifFalse: [ ^ nil ].
	node := SmaCCCharacterRENode characters: (self charactersFor: symbol).
	node position: SmallInteger maxVal.	"Implicit nodes have least precedence"
	^ node
]

{ #category : #'class initialization' }
SmaCCGrammar class >> initialize [
	self maximumCharacterValue: 255.
	"A good default of isExpressions -- you can set to nil to have it compute from the image"
	self isExpressions: #(isAlphaNumeric isDigit isLetter isLiteral isLowercase isSeparator isSpecial isUppercase isVowel)
]

{ #category : #accessing }
SmaCCGrammar class >> isExpressionMap [
	"Creates a map from selectors that start with 'is' on Character to sets of characters. This allows generated scanners to take
	full advantage of selectors that are already implemented on Character"

	(IsExpressionMap isNil or: [ IsExpressionMaxCharacter ~= self maximumCharacterValue ])
		ifTrue: [ | selectors |
			IsExpressionMaxCharacter := self maximumCharacterValue.
			IsExpressionMap := Dictionary new.
			selectors := IsExpressions
				ifNil: [ Character selectors select: [ :each | each size > 2 and: [ (each beginsWith: 'is') and: [ each numArgs = 0 and: [ (each at: 3) isUppercase ] ] ] ] ].
			selectors
				do: [ :sel | 
					| string |
					string := self generateCharacterSetFor: sel.
					string isEmpty
						ifFalse: [ IsExpressionMap at: sel put: string ] ] ].
	^ IsExpressionMap
]

{ #category : #accessing }
SmaCCGrammar class >> isExpressions [
	^ IsExpressions
]

{ #category : #accessing }
SmaCCGrammar class >> isExpressions: aCollection [
	"Assign a collection of Character is___ selectors that can be used to create the scanner. These can make the generated scanners easier to read as a test like currentCharacter isAlphaNumeric is easier to read than a test of '(currentCharacter >= $A and: [currentCharacter <= $Z]) or: [(currentCharacter >= $a and: [currentCharacter <= $z]) or: [currentCharacter >= $0 and: [currentCharacter <= $9]]]'. If the collection is nil, SmaCC will automatically create the set of all is___ methods that are in the current image. This may result in a scanner that doesn't work in a different image. If you wish to limit the selectors that can be used, you can set them here:
	
	self isExpressions: #(isAlphaNumeric isDigit isLetter isLiteral isLowercase isSeparator isSpecial isUppercase isVowel)
	
	"

	IsExpressions := aCollection.
	IsExpressionMap := nil
]

{ #category : #accessing }
SmaCCGrammar class >> maximumCharacterValue [
	^ MaximumCharacterValue
]

{ #category : #accessing }
SmaCCGrammar class >> maximumCharacterValue: anInteger [
	MaximumCharacterValue := anInteger
]

{ #category : #accessing }
SmaCCGrammar class >> tokenNameBlock [
	^ TokenNameBlock
		ifNil: [ [ :string | self defaultTokenNameFor: string ] ]
]

{ #category : #accessing }
SmaCCGrammar class >> tokenNameBlock: aBlock [
	TokenNameBlock := aBlock
]

{ #category : #accessing }
SmaCCGrammar class >> tokenNameMap [
	^ TokenNameMap ifNil: [ TokenNameMap := self defaultTokenNameMap ]
]

{ #category : #accessing }
SmaCCGrammar class >> tokenNameMap: aDictionary [
	TokenNameMap := aDictionary
]

{ #category : #accessing }
SmaCCGrammar >> addExtraSymbols [
	self addSymbol: self emptySymbol.
	self addSymbol: self errorSymbol
]

{ #category : #accessing }
SmaCCGrammar >> addStartingSymbol: aSmaCCSymbol [
	(otherStartingSymbols includes: aSmaCCSymbol)
		ifFalse: [ otherStartingSymbols add: aSmaCCSymbol ]
]

{ #category : #private }
SmaCCGrammar >> addSymbol: aSmaCCSymbol [
	aSmaCCSymbol grammar: self.
	self symbols add: aSmaCCSymbol.
	^ aSmaCCSymbol
]

{ #category : #private }
SmaCCGrammar >> addSymbolFirst: aSmaCCSymbol [
	aSmaCCSymbol grammar: self.
	^ self symbols addFirst: aSmaCCSymbol
]

{ #category : #accessing }
SmaCCGrammar >> allStartingSymbols [
	"Return all starting symbols with the default starting symbol listed first."

	| startingSymbols default |
	default := self startSymbol.
	startingSymbols := otherStartingSymbols copy.
	startingSymbols remove: default symbol ifAbsent: [  ].
	startingSymbols := startingSymbols
		collect:
			[ :each | 
			(self newStartingSymbolNamed: each name)
				addProduction:
					(self newRHS
						add: each;
						yourself);
				yourself ].
	startingSymbols addFirst: default.
	^ startingSymbols
]

{ #category : #accessing }
SmaCCGrammar >> annotateTokens: aBoolean [
	annotateTokens := aBoolean
]

{ #category : #private }
SmaCCGrammar >> calculateFirstSets [
	| changed |
	changed := true.
	[ changed ]
		whileTrue:
			[ changed := false.
			self symbols
				do: [ :each | changed := changed | each calculateFirstTerminals ] ]
]

{ #category : #accessing }
SmaCCGrammar >> classDefinitions [
	| defs root |
	root := self rootDefinition.
	(root isNil and: [ classDefinitions notEmpty ])
		ifTrue:
			[ SmaCCCompilationNotification new
				messageText: 'Node generation';
				tag: 'Cannot generate node classes without specifying a "%root" node.';
				signal ].
	root isNil
		ifTrue: [ ^ #() ].
	defs := classDefinitions asOrderedCollection.
	defs
		do:
			[ :each | 
			(each isRoot not and: [ each superclass isNil ])
				ifTrue: [ each superclass: root ] ].
	^ defs
]

{ #category : #accessing }
SmaCCGrammar >> classNamed: aSymbol [
	^ classDefinitions
		at: aSymbol
		ifAbsentPut: [ SmaCCNodeClassDefinition named: aSymbol grammar: self ]
]

{ #category : #accessing }
SmaCCGrammar >> codeGenerator [
	^ codeGenerator
]

{ #category : #'initialize-release' }
SmaCCGrammar >> codeGenerator: aSmaCCCodeGenerator [
	codeGenerator := aSmaCCCodeGenerator.
	aSmaCCCodeGenerator grammar: self
]

{ #category : #accessing }
SmaCCGrammar >> emptySymbol [
	^ emptySymbol
		ifNil: [ emptySymbol := self newTerminalSymbolNamed: 'E O F' ]
]

{ #category : #accessing }
SmaCCGrammar >> emptySymbols [
	^ self symbols
		select: [ :each | each isTerminal not and: [ each isEmpty ] ]
]

{ #category : #accessing }
SmaCCGrammar >> errorSymbol [
	^ errorSymbol
		ifNil: [ errorSymbol := self newTerminalSymbolNamed: 'error' ]
]

{ #category : #private }
SmaCCGrammar >> findSymbolNamed: aString ifAbsent: aBlock [
	^ self symbols detect: [ :each | each name = aString ] ifNone: aBlock
]

{ #category : #private }
SmaCCGrammar >> findSymbolNamed: aString ifAbsentAdd: aBlock [
	^ self
		findSymbolNamed: aString
		ifAbsent: [ self addSymbol: aBlock value ]
]

{ #category : #private }
SmaCCGrammar >> findSymbolNamed: aString ifAbsentAddFirst: aBlock [
	^ self
		findSymbolNamed: aString
		ifAbsent: [ self addSymbolFirst: aBlock value ]
]

{ #category : #private }
SmaCCGrammar >> finishBuilding [
	self ignoreCase
		ifTrue:
			[ self symbols do: [ :each | each makeCaseInsensitive ].
			self mergeCaseSensitiveKeywords ].
	annotateTokens
		ifTrue:
			[ self symbols
				do: [ :each | each annotateTokenVariables: self class tokenNameBlock ] ]
]

{ #category : #testing }
SmaCCGrammar >> hasMultipleScannerStates [
	^ self scannerStates size > 1
]

{ #category : #testing }
SmaCCGrammar >> ignoreCase [
	^ ignoreCase
]

{ #category : #private }
SmaCCGrammar >> ignoreCase: aBoolean [
	ignoreCase := aBoolean
]

{ #category : #private }
SmaCCGrammar >> ignoredVariables [
	^ ignoredVariables
]

{ #category : #private }
SmaCCGrammar >> ignoredVariables: aCollection [
	ignoredVariables := aCollection asSet
]

{ #category : #accessing }
SmaCCGrammar >> initialItemSetFor: aSmaCCSymbol [
	^ aSmaCCSymbol asLRItemSet
		type: type;
		yourself
]

{ #category : #'initialize-release' }
SmaCCGrammar >> initialize [
	super initialize.
	scannerDefinition := SmaCCScannerDefinition new.
	type := #LALR1.
	symbols := OrderedCollection new.
	shiftReduceTable := Dictionary new.
	otherStartingSymbols := OrderedCollection new.
	classDefinitions := Dictionary new.
	prefix := suffix := ''.
	isGLR := false.
	ignoreCase := false.
	ignoredVariables := Set new.
	annotateTokens := false
]

{ #category : #testing }
SmaCCGrammar >> isGLR [
	^ isGLR
]

{ #category : #'initialize-release' }
SmaCCGrammar >> isGLR: aBoolean [
	isGLR := aBoolean
]

{ #category : #private }
SmaCCGrammar >> keywordRegularExpressionFor: aString [
	| regularExpressionString regex |
	regularExpressionString := (aString copyFrom: 2 to: aString size - 1) copyReplaceAll: '""' with: '"'.
	regex := regularExpressionString
		inject: nil
		into: [ :sum :each | 
			sum isNil
				ifTrue: [ SmaCCCharacterRENode characters: (SmaCCCharacterSet with: each) ]
				ifFalse: [ sum , (SmaCCCharacterRENode characters: (SmaCCCharacterSet with: each)) ] ].
	regex addStates: self scannerStates.
	^ regex
]

{ #category : #private }
SmaCCGrammar >> keywordTerminalNamed: aString [
	^ self
		findSymbolNamed: aString
		ifAbsentAddFirst:
			[ (self newTerminalSymbolNamed: aString)
				regularExpression: (self keywordRegularExpressionFor: aString);
				yourself ]
]

{ #category : #precedence }
SmaCCGrammar >> leftPrecedenceFor: aSmaCCSymbol [
	shiftReduceTable at: aSmaCCSymbol put: SmaCCReduceAction
]

{ #category : #accessing }
SmaCCGrammar >> makeTokenIdMethodFor: aString [
	| token |
	token := (scannerDefinition includesTokenNamed: aString)
		ifTrue: [ self terminalSymbolNamed: aString ]
		ifFalse:
			[ self
				findSymbolNamed: aString
				ifAbsentAdd: [ self newTerminalSymbolNamed: aString ] ].
	token createIdMethod: true
]

{ #category : #private }
SmaCCGrammar >> mergeAll: anOrderedCollection [
	| new first set |
	first := anOrderedCollection first.
	new := self newTerminalSymbolNamed: first name asUppercase.
	new regularExpression: first regularExpression.
	symbols add: new before: first.
	symbols removeAll: anOrderedCollection.
	set := anOrderedCollection asSet.
	self
		rhsDo:
			[ :each | 
			1 to: each size do:
				[ :i | 
				(set includes: (each at: i))
					ifTrue: [ each collection at: i put: new ] ] ]
]

{ #category : #private }
SmaCCGrammar >> mergeCaseSensitiveKeywords [
	| duplicateMap |
	duplicateMap := Dictionary new.
	self symbols
		do:
			[ :each | 
			(each isTerminal and: [ each name first = $" ])
				ifTrue:
					[ (duplicateMap
						at: each name asUppercase
						ifAbsentPut: [ OrderedCollection new ]) add: each ] ].
	duplicateMap
		keysAndValuesDo: [ :name :value | 
			value size > 1
				ifTrue: [ self mergeAll: value ] ]
]

{ #category : #'item creation' }
SmaCCGrammar >> newItemSet [
	^ SmaCCItemSet new
		grammar: self;
		yourself
]

{ #category : #'item creation' }
SmaCCGrammar >> newNonTerminalSymbolNamed: aString [
	^ (SmaCCNonTerminalSymbol name: aString)
		grammar: self;
		yourself
]

{ #category : #'item creation' }
SmaCCGrammar >> newRHS [
	^ SmaCCRHS new
		grammar: self;
		yourself
]

{ #category : #'item creation' }
SmaCCGrammar >> newStartingSymbolNamed: aString [
	^ (SmaCCStartingSymbol name: 'B e g i n' , aString)
		grammar: self;
		yourself
]

{ #category : #'item creation' }
SmaCCGrammar >> newTerminalSymbolNamed: aString [
	^ (SmaCCTerminalSymbol name: aString)
		grammar: self;
		yourself
]

{ #category : #precedence }
SmaCCGrammar >> nonAssociativePrecedenceFor: aSmaCCSymbol [
	shiftReduceTable at: aSmaCCSymbol put: SmaCCRejectAction
]

{ #category : #private }
SmaCCGrammar >> nonTerminalSymbolNamed: aString [
	^ self
		findSymbolNamed: aString
		ifAbsentAdd: [ self newNonTerminalSymbolNamed: aString ]
]

{ #category : #accessing }
SmaCCGrammar >> preferredActionFor: aSmaCCSymbol [
	^ shiftReduceTable at: aSmaCCSymbol ifAbsent: [ nil ]
]

{ #category : #accessing }
SmaCCGrammar >> prefix [
	^ prefix
]

{ #category : #'initialize-release' }
SmaCCGrammar >> prefix: aString [
	prefix := aString
]

{ #category : #accessing }
SmaCCGrammar >> rhsDo: aBlock [
	self symbols do: [ :each | each productionsDo: aBlock ]
]

{ #category : #precedence }
SmaCCGrammar >> rightPrecedenceFor: aSmaCCSymbol [
	shiftReduceTable at: aSmaCCSymbol put: SmaCCShiftAction
]

{ #category : #accessing }
SmaCCGrammar >> rootDefinition [
	^ classDefinitions detect: [ :each | each isRoot ] ifNone: [ nil ]
]

{ #category : #'initialize-release' }
SmaCCGrammar >> scannerDefinition [
	^ scannerDefinition
]

{ #category : #'initialize-release' }
SmaCCGrammar >> scannerDefinition: aSmaCCScannerDefinition [
	scannerDefinition := aSmaCCScannerDefinition
]

{ #category : #accessing }
SmaCCGrammar >> scannerStates [
	^ scannerDefinition states
]

{ #category : #accessing }
SmaCCGrammar >> sentinelSymbol [
	^ sentinelSymbol
		ifNil: [ sentinelSymbol := self newTerminalSymbolNamed: 'S e n t i n e l' ]
]

{ #category : #precedence }
SmaCCGrammar >> setOperatorPrecedenceFor: aSmaCCSymbol to: anInteger [
	aSmaCCSymbol precedence: anInteger
]

{ #category : #accessing }
SmaCCGrammar >> setStartSymbolIfNone: aSmaCCSymbol [
	| startSymbol |
	self startSymbol notNil
		ifTrue: [ ^ self ].
	startSymbol := self newStartingSymbolNamed: ''.
	self addSymbol: startSymbol.
	startSymbol
		addProduction:
			(self newRHS
				add: aSmaCCSymbol;
				yourself)
]

{ #category : #accessing }
SmaCCGrammar >> startSymbol [
	^ self symbols
		detect: [ :each | each isStartingSymbol ]
		ifNone: [ nil ]
]

{ #category : #accessing }
SmaCCGrammar >> suffix [
	^ suffix
]

{ #category : #'initialize-release' }
SmaCCGrammar >> suffix: aString [
	suffix := aString
]

{ #category : #private }
SmaCCGrammar >> symbols [
	^ symbols
]

{ #category : #private }
SmaCCGrammar >> symbols: aCollection [
	symbols := aCollection
]

{ #category : #private }
SmaCCGrammar >> terminalSymbolNamed: aString [
	^ self
		findSymbolNamed: aString
		ifAbsentAdd:
			[ (self newTerminalSymbolNamed: aString)
				regularExpression: (scannerDefinition tokenNamed: aString);
				yourself ]
]

{ #category : #accessing }
SmaCCGrammar >> tokens [
	^ scannerDefinition tokens
]

{ #category : #'initialize-release' }
SmaCCGrammar >> type: aSmaCCSymbol [
	type := aSmaCCSymbol
]

{ #category : #accessing }
SmaCCGrammar >> unusedSymbols [
	| nonTerminals problemSymbols todo |
	nonTerminals := self symbols reject: [ :each | each isTerminal ].
	todo := OrderedCollection withAll: self allStartingSymbols.
	problemSymbols := nonTerminals asSet
		reject: [ :each | todo includes: each ].
	[ todo isEmpty ]
		whileFalse:
			[ todo removeFirst
				productionsDo:
					[ :rhs | 
					rhs
						do:
							[ :each | 
							(problemSymbols includes: each)
								ifTrue: [ todo add: each.
									problemSymbols remove: each ] ] ] ].
	^ problemSymbols
]
