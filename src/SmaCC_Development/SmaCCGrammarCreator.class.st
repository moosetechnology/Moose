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

{ #category : #private }
SmaCCGrammarCreator >> reportErrorMessage: aString on: aSmaCCToken [
	SmaCCParserError new
		messageText: aString;
		tag: aSmaCCToken;
		signal
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
SmaCCGrammarCreator >> visitDefinitionError: anError [
	"We shouldn't get here, but in case someone is passing an AST with errors, signal an error."

	self error: 'There was a parse error'
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
	name = 'lr1'
		ifTrue: [ ^ grammar type: #LR1 ].
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
SmaCCGrammarCreator >> visitTokenRule: aTokenRule [
	| symbol regex |
	regex := aTokenRule regularExpression.
	regex states isEmpty
		ifTrue: [ regex addStates: grammar scannerDefinition nonExcludeStates ].
	grammar scannerDefinition addToken: regex withName: aTokenRule name value.
	symbol := grammar findSymbolNamed: aTokenRule name value ifAbsent: [ nil ].
	symbol notNil
		ifTrue: [ symbol regularExpression: regex ].
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
