Class {
	#name : #SmaCCGrammarCreator,
	#superclass : #SmaCCDefinitionNodeVisitor,
	#instVars : [
		'grammar',
		'defaultClasses',
		'expansionCount'
	],
	#classVars : [
		'MaxExpansions'
	],
	#category : #'SmaCC_Development'
}

{ #category : #building }
SmaCCGrammarCreator class >> buildGrammar: aSmaCCGrammar from: aSmaCCDefinitionNode [
	self new
		grammar: aSmaCCGrammar;
		accept: aSmaCCDefinitionNode.
	^ aSmaCCGrammar
]

{ #category : #'class initialization' }
SmaCCGrammarCreator class >> initialize [
	MaxExpansions := 16
]

{ #category : #private }
SmaCCGrammarCreator >> addItems: aCollection to: rhs [
	aCollection
		do: [ :each | 
			rhs add: (self acceptNode: each).
			each variableNameToken notNil
				ifTrue: [ rhs
						nameLastItem:
							(each variableNameToken value
								copyFrom: 2
								to: each variableNameToken value size - 1) ] ]
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> allCharacters [
	^ SmaCCGrammar allCharacters
]

{ #category : #private }
SmaCCGrammarCreator >> buildItemsFrom: aCollection [
	^ aCollection
		collect: [ :item | 
			| items |
			items := OrderedCollection new.
			((item possibilities > 1 and: [ item possibilities * expansionCount <= MaxExpansions ]) or: [ item isGroup and: [ item hasReductionExpression not ] ])
				ifTrue: [ expansionCount := item possibilities * expansionCount.
					item alternativesDo: [ :each | items addAll: (self combineItems: (self buildItemsFrom: each)) ] ]
				ifFalse: [ items add: (Array with: item) ].
			items ]
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> carriageReturnString [
	^ SmaCCCharacterSet with: (Character value: 13)
]

{ #category : #private }
SmaCCGrammarCreator >> charactersFor: aStream in: aToken [
	| characters char endCharacters |
	aStream atEnd
		ifTrue: [ self reportCharacterBlockErrorForToken: aToken ].
	char := aStream next.
	characters := char == $\
		ifTrue: [ (self nodeFor: aStream) characters ]
		ifFalse: [ OrderedCollection with: char ].
	(characters size = 1 and: [ aStream peekFor: $- ])
		ifFalse: [ ^ characters ].
	endCharacters := self charactersFor: aStream in: aToken.
	endCharacters size > 1
		ifTrue: [ self reportCharacterBlockErrorForToken: aToken ].
	^ (characters first asInteger to: endCharacters first asInteger) collect: [ :each | Character value: each ]
]

{ #category : #private }
SmaCCGrammarCreator >> combineItems: aCollection [
	| items |
	items := OrderedCollection new.
	self combineStream: (ReadStream on: aCollection) into: OrderedCollection new andDo: [ :each | items add: each ].
	^ items
]

{ #category : #private }
SmaCCGrammarCreator >> combineStream: aStream into: aCollection andDo: aBlock [
	| size position |
	aStream atEnd
		ifTrue: [ ^ aBlock value: aCollection copy ].
	size := aCollection size.
	position := aStream position + 1.
	aStream next
		do: [ :each | 
			aCollection addAll: each.
			self combineStream: aStream into: aCollection andDo: aBlock ]
		separatedBy: [ [ aCollection size > size ] whileTrue: [ aCollection removeLast ].
			aStream position: position ]
]

{ #category : #private }
SmaCCGrammarCreator >> createClass: aSymbol for: aSmaCCRHS [
	(grammar classNamed: aSymbol) addProduction: aSmaCCRHS.
	^ aSmaCCRHS
]

{ #category : #private }
SmaCCGrammarCreator >> createDefaultClassFor: aSmaCCRHS [
	defaultClasses add: aSmaCCRHS.
	^ aSmaCCRHS
]

{ #category : #private }
SmaCCGrammarCreator >> createDefaultClassesForSymbol: aString [
	| className index |
	className := aString capitalized.
	[ index := className indexOf: $_.
	index > 0 and: [ className size > 1 ] ]
		whileTrue: [ className := (className copyFrom: 1 to: index - 1) , (className copyFrom: index + 1 to: className size) capitalized ].
	className := className asSymbol.
	defaultClasses do: [ :each | self createClass: className for: each ].
	defaultClasses := OrderedCollection new
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> formFeedString [
	^ SmaCCCharacterSet with: (Character value: 12)
]

{ #category : #private }
SmaCCGrammarCreator >> generateImplicitToken: aSmaCCToken [
	| node |
	node := SmaCCGrammar implicitToken: aSmaCCToken value.
	node isNil
		ifTrue: [ self reportErrorMessage: 'Token not specified' on: aSmaCCToken ].
	^ node
]

{ #category : #private }
SmaCCGrammarCreator >> generateRHS: aCollection [
	| rhs |
	rhs := grammar newRHS.
	self addItems: aCollection to: rhs.
	^ rhs
]

{ #category : #'initialize-release' }
SmaCCGrammarCreator >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> hexStringFrom: aStream [
	^ SmaCCCharacterSet with: (Character value: (self hexValueFrom: aStream))
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> hexValueFrom: aStream [
	| char value count |
	count := value := 0.
	[ aStream atEnd not
		and: [ count < 4
				and: [ char := aStream peek.
					(char between: $0 and: $9) or: [ (char between: $A and: $F) or: [ char between: $a and: $f ] ] ] ] ]
		whileTrue: [ count := count + 1.
			value := value * 16 + aStream next digitValue ].
	^ value
]

{ #category : #'initialize-release' }
SmaCCGrammarCreator >> initialize [
	super initialize.
	defaultClasses := OrderedCollection new
]

{ #category : #testing }
SmaCCGrammarCreator >> isDigit: each [
	^ each between: $0 and: $9
]

{ #category : #testing }
SmaCCGrammarCreator >> isLetterOrDigit: each [
	^ (each between: $a and: $z)
		or:
			[ (each between: $A and: $Z)
				or: [ (each between: $0 and: $9) or: [ each == $_ ] ] ]
]

{ #category : #testing }
SmaCCGrammarCreator >> isWhitespace: each [
	^ self whitespaceValues includes: each asInteger
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> newlineString [
	^ SmaCCCharacterSet with: (Character value: 10)
]

{ #category : #private }
SmaCCGrammarCreator >> nodeFor: aStream [
	| block char |
	block := nil.
	char := aStream next.
	char == $f
		ifTrue: [ ^ SmaCCCharacterRENode characters: self formFeedString ].
	char == $n
		ifTrue: [ ^ SmaCCCharacterRENode characters: self newlineString ].
	char == $r
		ifTrue: [ ^ SmaCCCharacterRENode characters: self carriageReturnString ].
	char == $t
		ifTrue: [ ^ SmaCCCharacterRENode characters: self tabString ].
	char == $v
		ifTrue: [ ^ SmaCCCharacterRENode characters: self verticalTabString ].
	char == $c
		ifTrue: [ ^ SmaCCCharacterRENode characters: (SmaCCCharacterSet with: (Character value: aStream next asInteger - $A asInteger)) ].
	char == $x
		ifTrue: [ ^ SmaCCCharacterRENode characters: (self hexStringFrom: aStream) ].
	char == $d
		ifTrue: [ block := [ :each | self isDigit: each ] ].
	char == $D
		ifTrue: [ block := [ :each | (self isDigit: each) not ] ].
	char == $s
		ifTrue: [ block := [ :each | self isWhitespace: each ] ].
	char == $S
		ifTrue: [ block := [ :each | (self isWhitespace: each) not ] ].
	char == $w
		ifTrue: [ block := [ :each | self isLetterOrDigit: each ] ].
	char == $W
		ifTrue: [ block := [ :each | (self isLetterOrDigit: each) not ] ].
	block isNil
		ifTrue: [ ^ SmaCCCharacterRENode characters: (SmaCCCharacterSet with: char) ].
	^ SmaCCCharacterRENode characters: (self allCharacters select: block)
]

{ #category : #private }
SmaCCGrammarCreator >> parseCharacterBlock: aToken [
	| characters aStream invert node |
	aStream := ReadStream on: (aToken value copyFrom: 2 to: aToken value size - 1).
	characters := OrderedCollection new.
	invert := aStream peekFor: $^.
	[ aStream atEnd ] whileFalse: [ characters addAll: (self charactersFor: aStream in: aToken) ].
	node := SmaCCCharacterRENode characters: (SmaCCCharacterSet withAll: characters).
	invert
		ifTrue: [ node := SmaCCNotRENode on: node ].
	^ node
]

{ #category : #private }
SmaCCGrammarCreator >> reportCharacterBlockErrorForToken: aToken [
	self reportErrorMessage: 'Invalid character block' on: aToken
]

{ #category : #private }
SmaCCGrammarCreator >> reportErrorMessage: aString on: aSmaCCToken [
	SmaCCParserError new
		messageText: aString;
		tag: aSmaCCToken;
		signal
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> tabString [
	^ SmaCCCharacterSet withAll: '	'
]

{ #category : #private }
SmaCCGrammarCreator >> verifyCodeToken: codeToken for: aSmaCCRHS [
	| code |
	code := codeToken value copyFrom: 2 to: codeToken value size - 1.
	RBParser
		parseExpression: code
		onError:
			[ :string :position | self reportErrorMessage: string on: (SmaCCToken value: (code copyFrom: position to: position) start: codeToken startPosition + position ids: #()) ].
	aSmaCCRHS reduceActionSource: code.
	^ aSmaCCRHS
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> verticalTabString [
	^ SmaCCCharacterSet with: (Character value: 11)
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitAlternationRegex: anAlternationRegex [
	^ (self acceptNode: anAlternationRegex left) | (self acceptNode: anAlternationRegex right)
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitAssociativeDirective: anAssociativeDirective [
	| type |
	type := anAssociativeDirective typeToken value = 'left'
		ifTrue: [ #leftPrecedenceFor: ]
		ifFalse: [ anAssociativeDirective typeToken value = 'right'
				ifTrue: [ #rightPrecedenceFor: ]
				ifFalse: [ #nonAssociativePrecedenceFor: ] ].
	anAssociativeDirective symbols
		do: [ :each | 
			| symbol |
			symbol := self acceptNode: each.
			grammar
				perform: type with: symbol;
				setOperatorPrecedenceFor: symbol to: anAssociativeDirective typeToken startPosition ]
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitAttributeDirective: anAttributeDirective [
	(grammar classNamed: anAttributeDirective classname value asSymbol)
		extraAttributes: (anAttributeDirective names collect: [ :each | SmaCCVariableDefinition variableName: each value ])
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitCharacterBlockRegex: aCharacterBlockRegex [
	^ self parseCharacterBlock: aCharacterBlockRegex block value
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitCharacterRegex: aCharacterRegex [
	| char |
	char := aCharacterRegex char value.
	char = '.'
		ifTrue: [ ^ SmaCCCharacterRENode characters: self allCharacters ].
	char first = $\
		ifTrue: [ ^ self nodeFor: (ReadStream on: (char copyFrom: 2 to: char size)) ].
	^ SmaCCCharacterRENode characters: (SmaCCCharacterSet withAll: char)
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitClassProductionExpression: aClassProductionExpression [
	| items |
	items := super visitClassProductionExpression: aClassProductionExpression.
	items
		do: [ :rhs | 
			aClassProductionExpression classname isNil
				ifTrue: [ self createDefaultClassFor: rhs ]
				ifFalse: [ self createClass: aClassProductionExpression classname value asSymbol for: rhs ] ].
	^ items
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitCodeProductionExpression: aCodeProdutionExpression [
	| items |
	items := super visitCodeProductionExpression: aCodeProdutionExpression.
	items do: [ :rhs | self verifyCodeToken: aCodeProdutionExpression code for: rhs ].
	^ items
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitConcatenationRegex: aConcatenationRegex [
	^ (self acceptNode: aConcatenationRegex left) , (self acceptNode: aConcatenationRegex right)
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitErrorSymbol: anErrorSymbol [
	^ grammar errorSymbol
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitFlagDirective: aFlagDirective [
	| name |
	name := aFlagDirective typeToken value.
	name = 'glr'
		ifTrue: [ ^ grammar isGLR: true ].
	name = 'ignorecase'
		ifTrue: [ ^ grammar ignoreCase: true ].
	name = 'annotate_tokens'
		ifTrue: [ ^ grammar annotateTokens: true ].
	self reportErrorMessage: 'Unknown directive' on: aFlagDirective typeToken
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitGrammarDefinition: aGrammarDefinition [
	self acceptNodes: aGrammarDefinition rules.
	grammar addExtraSymbols.
	^ grammar
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitGroupTerm: aGroupTerm [
	| symbol |
	symbol := grammar nonTerminalSymbolNamed: aGroupTerm source.
	symbol size = 0
		ifTrue: [ symbol position: aGroupTerm startPosition.
			aGroupTerm expressions do: [ :each | (self acceptNode: each) do: [ :rhs | symbol addProduction: rhs ] ] ].
	^ symbol
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitIdDirective: anIdDirective [
	anIdDirective names do: [ :each | grammar makeTokenIdMethodFor: each value ]
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitIgnoreVariableDirective: anIgnoreVariableDirective [
	grammar ignoredVariables: (anIgnoreVariableDirective names collect: [ :each | each value ])
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitKeywordSymbol: aKeywordSymbol [
	^ grammar keywordTerminalNamed: aKeywordSymbol name value
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitNameRegex: aNameRegex [
	^ SmaCCSequenceRENode
		nodes: (aNameRegex name value asOrderedCollection collect: [ :each | SmaCCCharacterRENode characters: (SmaCCCharacterSet with: each) ])
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitNodeNameDirective: aNodeNameDirective [
	| type name |
	type := aNodeNameDirective typeToken value.
	name := aNodeNameDirective name value.
	type = 'prefix'
		ifTrue: [ ^ grammar prefix: name ].
	type = 'suffix'
		ifTrue: [ ^ grammar suffix: name ].
	type = 'root'
		ifTrue: [ ^ (grammar classNamed: name asSymbol) beRoot ].
	self reportErrorMessage: 'Unknown directive' on: aNodeNameDirective typeToken
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitPostfixTerm: aPostfixTerm [
	| operator expression symbol rhs varNameToken hasOne hasMany addBlock |
	operator := aPostfixTerm operator value.
	expression := self acceptNode: aPostfixTerm term.
	symbol := grammar nonTerminalSymbolNamed: aPostfixTerm source.
	symbol size = 0
		ifTrue: [ symbol position: aPostfixTerm startPosition.
			hasOne := operator = '+'.
			hasMany := operator ~= '?'.
			varNameToken := (aPostfixTerm term isKindOf: SmaCCSymbolNode)
				ifTrue: [ aPostfixTerm term variableNameToken ].
			rhs := grammar newRHS.
			addBlock := [ rhs add: expression.
			varNameToken notNil
				ifTrue: [ rhs nameLastItem: (varNameToken value copyFrom: 2 to: varNameToken value size - 1) ] ].
			hasOne
				ifTrue: [ addBlock value ].
			symbol addProduction: rhs.
			rhs := grammar newRHS.
			hasMany
				ifTrue: [ rhs add: symbol ].
			addBlock value.
			symbol addProduction: rhs ].
	^ symbol
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitProductionExpression: aClassProductionExpression [
	expansionCount := 1.
	^ (self combineItems: (self buildItemsFrom: aClassProductionExpression terms)) collect: [ :items | self generateRHS: items ]
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitProductionRule: aProductionRule [
	| symbol |
	symbol := grammar nonTerminalSymbolNamed: aProductionRule name value.
	symbol position: aProductionRule name startPosition.
	aProductionRule expressions do: [ :each | (self acceptNode: each) do: [ :rhs | symbol addProduction: rhs ] ].
	self createDefaultClassesForSymbol: aProductionRule name value.
	grammar setStartSymbolIfNone: symbol.
	^ symbol
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitProductionSymbol: aProductionSymbol [
	^ grammar nonTerminalSymbolNamed: aProductionSymbol name value
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitRepeatRegex: aRepeatRegex [
	| regex count |
	regex := self acceptNode: aRepeatRegex regex.
	count := aRepeatRegex count value.
	count = '*'
		ifTrue: [ ^ regex repeat ].
	count = '+'
		ifTrue: [ ^ regex repeatForAtLeast: 1 ].
	count = '?'
		ifTrue: [ ^ regex repeatFor: 0 to: 1 ].
	count first = ${
		ifTrue: [ | readStream start stop |
			readStream := ReadStream on: (count copyFrom: 2 to: count size - 1).
			start := readStream upTo: $,.
			stop := readStream upToEnd.
			^ regex
				repeatFor:
					(start isEmpty
						ifTrue: [ 0 ]
						ifFalse: [ start asNumber ])
				to:
					(stop isEmpty
						ifTrue: [ 1 bitShift: 31 ]
						ifFalse: [ stop asNumber ]) ].
	self reportErrorMessage: 'Unknown repeat count' on: aRepeatRegex count
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitScopeDirective: aScopeDirective [
	| type |
	type := aScopeDirective typeToken value.
	(type = 'scopes' or: [ type = 'states' ])
		ifTrue: [ ^ aScopeDirective names do: [ :each | grammar scannerDefinition addState: each value asSymbol ] ].
	type = 'excludes'
		ifTrue: [ ^ aScopeDirective names do: [ :each | grammar scannerDefinition addExcludeState: each value asSymbol ] ].
	self reportErrorMessage: 'Unknown directive' on: aScopeDirective typeToken
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitStartDirective: aStartDirective [
	aStartDirective symbols do: [ :each | grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: each value) ]
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitSuperclassDirective: aSuperclassDirective [
	| superclass |
	superclass := grammar classNamed: aSuperclassDirective superclass value asSymbol.
	aSuperclassDirective names do: [ :each | (grammar classNamed: each value) superclass: superclass ]
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitTokenRegex: aTokenRegex [
	^ (grammar scannerDefinition tokenNamed: aTokenRegex name value ifAbsentPut: [ self generateImplicitToken: aTokenRegex name ]) copy
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitTokenRule: aTokenRule [
	| symbol regex |
	regex := self acceptNode: aTokenRule regex.
	regex position: aTokenRule name startPosition.
	grammar scannerDefinition addToken: regex withName: aTokenRule name value.
	symbol := grammar findSymbolNamed: aTokenRule name value ifAbsent: [ nil ].
	symbol notNil
		ifTrue: [ symbol regularExpression: regex ].
	aTokenRule states do: [ :each | regex addState: each value asSymbol ].
	regex states isEmpty
		ifTrue: [ regex addStates: grammar scannerDefinition nonExcludeStates ].
	^ regex
]

{ #category : #visiting }
SmaCCGrammarCreator >> visitTokenSymbol: aTokenSymbol [
	^ grammar
		findSymbolNamed: aTokenSymbol name value
		ifAbsentAdd: [ | node symbol |
			symbol := grammar newTerminalSymbolNamed: aTokenSymbol name value.
			(grammar scannerDefinition includesTokenNamed: aTokenSymbol name value)
				ifTrue: [ symbol regularExpression: (grammar scannerDefinition tokenNamed: aTokenSymbol name value) ]
				ifFalse: [ node := SmaCCGrammar implicitToken: aTokenSymbol name value.
					node notNil
						ifTrue: [ node addStates: grammar scannerDefinition nonExcludeStates.
							symbol regularExpression: node ] ].
			symbol ]
]

{ #category : #'private-strings' }
SmaCCGrammarCreator >> whitespaceValues [
	^ #[9 10 11 12 13 32]
]
